; DESCRIPTION: Composite: Creates a magenta circular shape at (427, 104) with radius 26 then Places a orange dot at position (9, 208) then Places a magenta 58x110 rectangle at position (96, 18).
; PLAN: r0=427(x), r1=104(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=208(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=96(x), r11=18(y), r12=58(width), r13=110(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 104
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 208
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 96
LDI r11, 18
LDI r12, 58
LDI r13, 110
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
