; DESCRIPTION: Draws a magenta line from (335, 128) to (88, 152).
; PLAN: r0=335(x1), r1=128(y1), r2=88(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 128
LDI r2, 88
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
