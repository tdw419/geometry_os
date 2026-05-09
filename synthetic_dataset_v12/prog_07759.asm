; DESCRIPTION: Draws a magenta line from (501, 62) to (325, 64).
; PLAN: r0=501(x1), r1=62(y1), r2=325(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 62
LDI r2, 325
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
