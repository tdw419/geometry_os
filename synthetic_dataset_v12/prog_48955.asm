; DESCRIPTION: Draws a blue line from (129, 183) to (76, 255).
; PLAN: r0=129(x1), r1=183(y1), r2=76(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 183
LDI r2, 76
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
