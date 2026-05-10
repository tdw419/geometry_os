; DESCRIPTION: Composite: Creates a black circular shape at (341, 172) with radius 71 then Renders a blue line between points (132, 211) and (359, 251) then Places a magenta dot at position (272, 38).
; PLAN: r0=341(x), r1=172(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=211(y1), r7=359(x2), r8=251(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=272(x), r11=38(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 172
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 211
LDI r7, 359
LDI r8, 251
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 38
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
