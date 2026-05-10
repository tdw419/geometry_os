; DESCRIPTION: Composite: Places a red dot at position (510, 61) then Draws a orange rectangle at (41, 104) with width 25 and height 72 then Creates a white circular shape at (408, 76) with radius 75.
; PLAN: r0=510(x), r1=61(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=104(y), r7=25(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=76(y), r12=75(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 61
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 41
LDI r6, 104
LDI r7, 25
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 76
LDI r12, 75
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
