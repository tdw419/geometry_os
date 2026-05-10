; DESCRIPTION: Composite: Places a orange line segment connecting (139, 95) to (172, 71) then Creates a orange circular shape at (332, 30) with radius 29 then Places a blue dot at position (242, 166).
; PLAN: r0=139(x1), r1=95(y1), r2=172(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=30(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x), r11=166(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 95
LDI r2, 172
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 30
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 166
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
