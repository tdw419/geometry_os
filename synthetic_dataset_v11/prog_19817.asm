; DESCRIPTION: Draws a purple line from (181, 242) to (62, 168).
; PLAN: r0=181(x1), r1=242(y1), r2=62(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 242
LDI r2, 62
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
