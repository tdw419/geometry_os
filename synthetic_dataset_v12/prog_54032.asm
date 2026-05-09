; DESCRIPTION: Draws a magenta line from (444, 192) to (72, 92).
; PLAN: r0=444(x1), r1=192(y1), r2=72(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 192
LDI r2, 72
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
