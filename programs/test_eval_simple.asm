; test_eval_simple.asm - Minimal EVAL test
LDI r1, 0x2000
LDI r2, 0x3000
; EVAL script_addr_reg, result_buf_reg
0xF7
1
2
HALT