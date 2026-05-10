; DESCRIPTION: Composite: Places a orange 28x26 rectangle at position (190, 203) then Sets a single white pixel at (199, 78) then Draws a blue circle centered at (368, 109) with radius 78.
; PLAN: r0=190(x), r1=203(y), r2=28(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=78(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=109(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 203
LDI r2, 28
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 78
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 368
LDI r11, 109
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
