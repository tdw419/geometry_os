; DESCRIPTION: Renders a black line between points (63, 244) and (278, 185).
; PLAN: r0=63(x1), r1=244(y1), r2=278(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 244
LDI r2, 278
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
