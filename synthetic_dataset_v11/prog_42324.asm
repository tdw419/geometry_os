; DESCRIPTION: Renders a black line between points (244, 185) and (98, 198).
; PLAN: r0=244(x1), r1=185(y1), r2=98(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 185
LDI r2, 98
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
