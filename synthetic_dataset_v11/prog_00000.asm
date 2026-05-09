; DESCRIPTION: Draws a blue line from (62, 248) to (183, 237).
; PLAN: r0=62(x1), r1=248(y1), r2=183(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 248
LDI r2, 183
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
