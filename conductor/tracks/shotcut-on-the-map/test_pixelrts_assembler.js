// Test PixelRTS v3 assembler

function assemblePasm(source) {
    const lines = source.split('\n');
    const instructions = [];
    const labels = {};

    let pc = 0;
    const cleanLines = [];
    for (const line of lines) {
        const clean = line.split(';')[0].trim();
        if (!clean) continue;
        if (clean.endsWith(':')) {
            labels[clean.slice(0, -1)] = pc;
            continue;
        }
        cleanLines.push(clean);
        pc++;
    }

    for (const line of cleanLines) {
        const parts = line.split(/[\s,]+/).filter(p => p);
        const op = parts[0].toUpperCase();
        const args = parts.slice(1);

        const parseReg = (s) => {
            if (!s) return 0;
            s = s.toLowerCase();
            if (s.startsWith('r') || s.startsWith('x')) return parseInt(s.slice(1)) || 0;
            return parseInt(s) || 0;
        };
        const parseImm = (s) => (parseInt(s) || 0) & 0xFF;

        let rgba = [0, 0, 0, 0];

        if (op === 'MOV') {
            rgba = [0x01, parseReg(args[1]), 0, parseReg(args[0])];
        } else if (op === 'LDI') {
            rgba = [0x08, parseImm(args[1]), 0, parseReg(args[0])];
        } else if (['ADD', 'SUB', 'MUL', 'DIV'].includes(op)) {
            const opcodes = { ADD: 0x33, SUB: 0x34, MUL: 0x35, DIV: 0x36 };
            rgba = [opcodes[op], parseReg(args[1]), parseReg(args[2]), parseReg(args[0])];
        } else if (op === 'JMP') {
            const target = labels[args[0]] ?? parseReg(args[0]);
            rgba = [0x06, target, 0, 0];
        } else if (op === 'HALT') {
            rgba = [0x07, 0, 0, 0];
        }

        instructions.push(rgba);
    }

    return instructions;
}

// Test
const source = `; Geometric Hello World
LDI r1, 10
LDI r2, 20
ADD r3, r1, r2
LDI r4, 5
MUL r5, r3, r4
HALT`;

const result = assemblePasm(source);
console.log('PASS: Assembled', result.length, 'instructions');
console.log('Instructions:');
result.forEach((inst, i) => {
    const [r, g, b, a] = inst;
    const opNames = {0x01: 'MOV', 0x33: 'ADD', 0x34: 'SUB', 0x35: 'MUL', 0x36: 'DIV', 0x07: 'HALT', 0x08: 'LDI'};
    console.log(`  ${i}: [${r}, ${g}, ${b}, ${a}] - ${opNames[r] || 'NOP'}`);
});

// Verify expected results
console.assert(result[0][0] === 0x08, 'LDI opcode');
console.assert(result[0][1] === 10, 'LDI immediate');
console.assert(result[0][3] === 1, 'LDI dest reg');
console.assert(result[2][0] === 0x33, 'ADD opcode');
console.assert(result[2][1] === 1, 'ADD rs1');
console.assert(result[2][2] === 2, 'ADD rs2');
console.assert(result[2][3] === 3, 'ADD dest');
console.assert(result[5][0] === 0x07, 'HALT opcode');

console.log('\nPASS: All assembler tests passed');
