; DESCRIPTION: Renders a black line between points (244, 128) and (151, 122).
; PLAN: r0=244(x1), r1=128(y1), r2=151(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 128
LDI r2, 151
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
