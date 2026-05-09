; DESCRIPTION: Composite: Places a magenta dot at position (201, 250) then Renders a red box of size 34x17 starting at (397, 124) then Creates a black circular shape at (252, 41) with radius 23.
; PLAN: r0=201(x), r1=250(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=124(y), r7=34(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x), r11=41(y), r12=23(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 250
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 124
LDI r7, 34
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 41
LDI r12, 23
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
