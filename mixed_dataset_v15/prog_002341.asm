; DESCRIPTION: Composite: Places a purple dot at position (309, 15) then Creates a purple rectangular region at (30, 123) spanning 27 by 97 pixels then Creates a green circular shape at (91, 222) with radius 18.
; PLAN: r0=309(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=30(x), r6=123(y), r7=27(width), r8=97(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x), r11=222(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 123
LDI r7, 27
LDI r8, 97
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 222
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
