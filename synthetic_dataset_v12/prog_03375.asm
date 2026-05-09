; DESCRIPTION: Composite: Renders a yellow box of size 11x106 starting at (378, 102) then Places a black line segment connecting (332, 17) to (374, 126).
; PLAN: r0=378(x), r1=102(y), r2=11(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=17(y1), r7=374(x2), r8=126(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 102
LDI r2, 11
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 17
LDI r7, 374
LDI r8, 126
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
