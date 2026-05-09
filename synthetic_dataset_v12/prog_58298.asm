; DESCRIPTION: Composite: Renders a red box of size 27x88 starting at (254, 117) then Places a yellow dot at position (408, 36) then Creates a green circular shape at (97, 75) with radius 44.
; PLAN: r0=254(x), r1=117(y), r2=27(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=36(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=75(y), r12=44(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 254
LDI r1, 117
LDI r2, 27
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 36
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 97
LDI r11, 75
LDI r12, 44
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
