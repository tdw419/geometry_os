; DESCRIPTION: Renders a black line between points (359, 132) and (274, 143).
; PLAN: r0=359(x1), r1=132(y1), r2=274(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 132
LDI r2, 274
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
