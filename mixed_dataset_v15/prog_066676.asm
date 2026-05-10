; DESCRIPTION: Composite: Sets a single black pixel at (88, 148) then Draws a orange rectangle at (425, 28) with width 14 and height 23 then Places a orange circle of radius 68 at center (343, 88).
; PLAN: r0=88(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=425(x), r6=28(y), r7=14(width), r8=23(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=88(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 425
LDI r6, 28
LDI r7, 14
LDI r8, 23
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 88
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
