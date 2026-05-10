; DESCRIPTION: Composite: Sets a single cyan pixel at (340, 18) then Places a white line segment connecting (5, 191) to (438, 13) then Creates a red circular shape at (137, 122) with radius 43.
; PLAN: r0=340(x), r1=18(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=5(x1), r6=191(y1), r7=438(x2), r8=13(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=137(x), r11=122(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 340
LDI r1, 18
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 5
LDI r6, 191
LDI r7, 438
LDI r8, 13
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 122
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
