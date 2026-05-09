; DESCRIPTION: Renders a black line between points (373, 106) and (184, 253).
; PLAN: r0=373(x1), r1=106(y1), r2=184(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 106
LDI r2, 184
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
