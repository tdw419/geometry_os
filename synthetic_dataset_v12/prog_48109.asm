; DESCRIPTION: Composite: Places a purple circle of radius 12 at center (429, 100) then Places a magenta dot at position (118, 41) then Draws a orange rectangle at (75, 99) with width 27 and height 23.
; PLAN: r0=429(x), r1=100(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=41(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=75(x), r11=99(y), r12=27(width), r13=23(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 100
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 41
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 75
LDI r11, 99
LDI r12, 27
LDI r13, 23
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
