; DESCRIPTION: Draws a magenta line from (185, 253) to (1, 92).
; PLAN: r0=185(x1), r1=253(y1), r2=1(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 253
LDI r2, 1
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
