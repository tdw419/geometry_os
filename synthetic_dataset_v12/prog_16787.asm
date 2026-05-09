; DESCRIPTION: Draws a blue line from (509, 62) to (278, 238).
; PLAN: r0=509(x1), r1=62(y1), r2=278(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 62
LDI r2, 278
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
