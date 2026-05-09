; DESCRIPTION: Renders a black line between points (211, 244) and (157, 133).
; PLAN: r0=211(x1), r1=244(y1), r2=157(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 244
LDI r2, 157
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
