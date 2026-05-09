; DESCRIPTION: Composite: Places a white dot at position (234, 208) then Creates a purple rectangular region at (409, 48) spanning 77 by 83 pixels then Creates a yellow circular shape at (455, 187) with radius 15.
; PLAN: r0=234(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=48(y), r7=77(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=187(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 48
LDI r7, 77
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 187
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
