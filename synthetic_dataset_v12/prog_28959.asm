; DESCRIPTION: Renders a black line between points (244, 161) and (359, 86).
; PLAN: r0=244(x1), r1=161(y1), r2=359(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 161
LDI r2, 359
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
