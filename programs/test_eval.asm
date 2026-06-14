; test_eval.asm - Test EVAL opcode (0xF7)
; Encoding: EVAL script_addr_reg, result_buf_reg
; Returns: r0 = 0 on success, GEOS error code on failure

; Load script address into r1
LDI r1, 0x2000

; Load result buffer address into r2
LDI r2, 0x3000

; Call EVAL (0xF7) - should return ENOTSUP in stub phase
0xF7
1
2

; Check result in r0
CMP r0, 0
JZ success

; If we get here, r0 != 0 (error expected in stub phase)
LDI r1, 0xFF0000
FILL r1
TEXT 128, 128, "EVAL stub: ENOTSUP"
HALT

success:
LDI r1, 0x00FF00
FILL r1
TEXT 128, 128, "EVAL: success"
HALT