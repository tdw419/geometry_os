; DESCRIPTION: Draws a blue line from (238, 106) to (128, 160).
; PLAN: r0=238(x1), r1=106(y1), r2=128(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 106
LDI r2, 128
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
