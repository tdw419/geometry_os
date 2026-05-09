; DESCRIPTION: Draws a magenta line from (362, 253) to (109, 3).
; PLAN: r0=362(x1), r1=253(y1), r2=109(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 253
LDI r2, 109
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
