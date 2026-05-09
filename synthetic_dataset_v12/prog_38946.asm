; DESCRIPTION: Renders a blue line between points (65, 244) and (319, 254).
; PLAN: r0=65(x1), r1=244(y1), r2=319(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 244
LDI r2, 319
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
