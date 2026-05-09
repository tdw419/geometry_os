; DESCRIPTION: Composite: Places a orange circle of radius 36 at center (366, 192) then Draws a orange rectangle at (399, 11) with width 101 and height 34 then Sets a single yellow pixel at (495, 13).
; PLAN: r0=366(x), r1=192(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=399(x), r6=11(y), r7=101(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=495(x), r11=13(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 192
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 399
LDI r6, 11
LDI r7, 101
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 13
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
