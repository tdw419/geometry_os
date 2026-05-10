; DESCRIPTION: Composite: Renders a green box of size 26x57 starting at (153, 71) then Sets a single black pixel at (297, 163) then Places a black circle of radius 12 at center (263, 35).
; PLAN: r0=153(x), r1=71(y), r2=26(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=163(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=35(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 71
LDI r2, 26
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 163
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 263
LDI r11, 35
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
