; DESCRIPTION: Renders a green line between points (244, 164) and (163, 62).
; PLAN: r0=244(x1), r1=164(y1), r2=163(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 164
LDI r2, 163
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
