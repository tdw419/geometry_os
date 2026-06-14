#!/bin/bash
# Generate synthetic syscall traces using Ollama (one syscall at a time)

SYSCALLS="fork pipe read close wait exit rmdir getpid"
MODEL="qwen2.5-coder:14b"
OLLAMA_ASK="/home/jericho/zion/bin/ollama-ask"

mkdir -p traces/synthetic

for syscall in $SYSCALLS; do
    echo "Generating synthetic traces for $syscall..."
    
    cat > /tmp/ollama_prompt.txt << EOF
Generate 15 realistic JSON examples of the "$syscall" syscall for xv6 RISC-V.

Format as JSON array. Each example needs:
- syscall: {number, name, description}
- arguments: {a0-a5 hex values}
- return_value: decimal
- program_counter: {ecall_entry, sret_return hex}
- semantics: {description, args, returns, memory_ops, spatial_ops}

Return ONLY JSON array, no other text.
EOF

    # Call Ollama
    timeout 60 $OLLAMA_ASK -m $MODEL -f /tmp/ollama_prompt.txt > /tmp/ollama_response.json 2>&1

    # Check if we got a response
    if [ -s /tmp/ollama_response.json ]; then
        # Extract JSON array
        python3 << PYEOF
import json, re, sys
syscall = "$syscall"
with open('/tmp/ollama_response.json') as f:
    content = f.read()
json_match = re.search(r'\[.*\]', content, re.DOTALL)
if json_match:
    try:
        records = json.loads(json_match.group())
        output = {
            'metadata': {
                'source': f'synthetic_ollama_{syscall}',
                'total_pairs': len(records),
                'unique_syscalls': 1
            },
            'statistics': {
                'total_syscalls': len(records),
                'syscall_counts': {syscall: len(records)},
                'unique_syscalls': 1
            },
            'syscalls': records
        }
        with open('traces/synthetic/synthetic_{}.json'.format(syscall), 'w') as out:
            json.dump(output, out, indent=2)
        print(f'✓ Generated {len(records)} traces for {syscall}')
    except Exception as e:
        print(f'✗ Parse error for {syscall}: {e}')
else:
    print(f'✗ No JSON found for {syscall}')
PYEOF
    else
        echo "✗ No response from Ollama for $syscall"
    fi
    
    # Cleanup
    rm -f /tmp/ollama_prompt.txt /tmp/ollama_response.json
done

echo ""
echo "Synthetic trace generation complete!"
ls -lh traces/synthetic/