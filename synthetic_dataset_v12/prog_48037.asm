; DESCRIPTION: Renders a blue line between points (166, 64) and (157, 149).
; PLAN: r0=166(x1), r1=64(y1), r2=157(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 64
LDI r2, 157
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
