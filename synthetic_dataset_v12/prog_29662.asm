; DESCRIPTION: Composite: Renders a orange box of size 116x67 starting at (270, 9) then Places a black dot at position (112, 238) then Creates a cyan circular shape at (314, 56) with radius 10.
; PLAN: r0=270(x), r1=9(y), r2=116(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=238(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=314(x), r11=56(y), r12=10(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 9
LDI r2, 116
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 238
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 314
LDI r11, 56
LDI r12, 10
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
