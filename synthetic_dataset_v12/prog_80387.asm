; DESCRIPTION: Composite: Creates a black circular shape at (211, 166) with radius 65 then Renders a white line between points (376, 43) and (335, 191) then Places a yellow dot at position (198, 114).
; PLAN: r0=211(x), r1=166(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x1), r6=43(y1), r7=335(x2), r8=191(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=198(x), r11=114(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 166
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 43
LDI r7, 335
LDI r8, 191
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 114
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
