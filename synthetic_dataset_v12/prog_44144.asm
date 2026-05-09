; DESCRIPTION: Composite: Renders a black line between points (328, 137) and (505, 156) then Sets a single green pixel at (113, 116).
; PLAN: r0=328(x1), r1=137(y1), r2=505(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=116(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 137
LDI r2, 505
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 116
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
