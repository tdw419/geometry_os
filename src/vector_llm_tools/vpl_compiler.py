import time
from datetime import datetime

class VPLTextCompiler:
    """
    Compiles VPL code to CVFSEngine operations
    All operations use text file storage
    """

    def __init__(self, cvfs_engine):
        self.engine = cvfs_engine
        self.symbol_table = {}  # Maps VPL variables to vector IDs
        self.instructions = []

    def compile_and_run(self, vpl_code, input_params=None):
        """Compile and execute VPL code in one step"""
        if input_params:
            self.symbol_table.update(input_params)

        lines = vpl_code.strip().split('\n')
        self._execute_block(lines)
        return self.symbol_table.get("result", []) # Return generic result if no explicit return

    def _execute_block(self, lines):
        """Execute a block of lines, handling nested structures"""
        i = 0
        while i < len(lines):
            line = lines[i].strip()
            
            if not line or line.startswith('#'):
                i += 1
                continue
                
            # Handle FOR loops (simple indentation-based)
            if line.startswith('FOR '):
                # FOR i IN RANGE(LEN(neighbors)):
                #   ...
                loop_header = line
                block_lines = []
                i += 1
                while i < len(lines) and (lines[i].startswith('    ') or lines[i].startswith('\t')):
                    block_lines.append(lines[i].strip())
                    i += 1
                self._compile_for(loop_header, block_lines)
                continue

            # Handle IF blocks (simple indentation-based)
            if line.startswith('IF '):
                if_header = line
                block_lines = []
                i += 1
                while i < len(lines) and (lines[i].startswith('    ') or lines[i].startswith('\t')):
                    block_lines.append(lines[i].strip())
                    i += 1
                
                # Execute IF
                condition = self._compile_if_condition(if_header)
                if condition:
                    self._execute_block(block_lines)
                continue

            # Standard Logic
            try:
                result = self._compile_line(line)
                if line.startswith('RETURN '):
                    return result
            except Exception as e:
                print(f"Error at line {i}: {line} -> {e}")

            i += 1

    def _compile_line(self, line):
        """Compile a single VPL line to CVFS operation"""
        # Vector assignment: v0 = LOAD("vec_123")
        if '=' in line:
            return self._compile_assignment(line)
        elif line.startswith('RETURN '):
            return self._resolve_symbol(line[7:].strip())
        else:
            return self._compile_operation(line)

    def _compile_assignment(self, line):
        """Compile assignment operations"""
        var, expr = line.split('=', 1)
        var = var.strip()
        expr = expr.strip()
        
        # Handle list/array initialization: high_quality = []
        if expr == '[]':
            self.symbol_table[var] = []
            return f"Initialized list {var}"

        # Parse function calls: FUN(arg1, arg2=val)
        op_name, args, kwargs = self._parse_function_call(expr)
        
        if op_name == 'LOAD':
            val = args[0].strip('"\'')
            if val.startswith('$'): val = self._resolve_symbol(val)
            self.symbol_table[var] = val # Mock: just store ID
            return f"Loaded {val} -> {var}"

        elif op_name == 'HNSW_STEP':
            # Mock HNSW step
            query = self._resolve_symbol(args[0])
            # Return dummy neighbors list for loop testing
            neighbors = [f"vec_{hash(query)}_{x}" for x in range(3)]
            self.symbol_table[var] = neighbors
            return f"HNSW found {len(neighbors)} neighbors"
            
        elif op_name == 'GATHER':
            # Mock gather
            self.symbol_table[var] = args[0]
            return "Gathered vectors"
            
        elif op_name == 'LEN':
            # Handle in-expression LEN if passed incorrectly
            return 0
            
        elif op_name == 'QUALITY_CHECK':
            # Check quality
            vec = args[0]
            # Deterministic mock quality based on hash
            quality = (hash(vec) % 100) / 100.0
            self.symbol_table[var] = quality
            return f"Quality {quality}"
            
        elif op_name == 'AVERAGE':
             # Mock average
             self.symbol_table[var] = "synthesized_vector_1"
             return "Averaged vector"

        elif op_name == 'L2':
            v1 = self._resolve_symbol(args[0])
            v2 = self._resolve_symbol(args[1])
            dist = 0.5 # Mock
            self.symbol_table[var] = dist
            return f"L2Dist: {dist}"

        else:
            # Fallback literal
            self.symbol_table[var] = expr
            return f"Assigned {var}"

    def _compile_for(self, header, block_lines):
        """Handle FOR i IN RANGE(LEN(neighbors))"""
        # Hacky parser for the specific syntax we use
        # Expected: FOR i IN RANGE(LEN(list_var))
        try:
            target_list_name = header.split('LEN(')[1].split(')')[0]
            target_list = self._resolve_symbol(target_list_name)
            
            iterator_name = header.split(' ')[1] # i
            
            if isinstance(target_list, list):
                for idx in range(len(target_list)):
                    self.symbol_table[iterator_name] = idx # Set loop var 'i'
                    self._execute_block(block_lines)
        except Exception as e:
            print(f"Loop error: {header} - {e}")

    def _compile_if_condition(self, header):
        """Compile IF condition"""
        condition = header[3:].strip().rstrip(':')
        if '>' in condition:
            l, r = condition.split('>')
            lv = float(self._resolve_symbol(l.strip()))
            rv = float(self._resolve_symbol(r.strip()))
            return lv > rv
        return False

    def _parse_function_call(self, expr):
        """Parse FUNC(a, b=1) into name, [args], {kwargs}"""
        if '(' not in expr: return None, [], {}
        name = expr.split('(')[0].strip()
        inner = expr.split('(')[1].rsplit(')', 1)[0]
        
        args = []
        kwargs = {}
        
        if inner:
            parts = [p.strip() for p in inner.split(',')]
            for p in parts:
                if '=' in p:
                    k, v = p.split('=')
                    kwargs[k.strip()] = v.strip()
                else:
                    args.append(p.strip())
        return name, args, kwargs

    def _resolve_symbol(self, symbol):
        """Resolve generic symbol"""
        # Handle array access: list[i]
        if '[' in symbol and ']' in symbol:
            name = symbol.split('[')[0]
            idx_expr = symbol.split('[')[1].strip(']')
            idx = self._resolve_symbol(idx_expr)
            arr = self.symbol_table.get(name)
            if arr and isinstance(idx, int) and 0 <= idx < len(arr):
                return arr[idx]
        
        # Handle literals
        if isinstance(symbol, str) and symbol.replace('.','',1).isdigit():
             return float(symbol)
             
        return self.symbol_table.get(symbol, symbol)

    # Legacy stub
    def _compile_operation(self, line):
        if '.append(' in line:
             # list.append(val)
             list_name = line.split('.append(')[0]
             val_expr = line.split('.append(')[1].strip(')')
             val = self._resolve_symbol(val_expr)
             if list_name in self.symbol_table:
                 self.symbol_table[list_name].append(val)
             return f"Appended {val} to {list_name}"
        return None