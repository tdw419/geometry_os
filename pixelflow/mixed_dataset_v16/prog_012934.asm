; DESCRIPTION: Composite: Places a blue 80x19 rectangle at position (285, 97) then Sets a single orange pixel at (199, 142) then Creates a yellow circular shape at (191, 76) with radius 71.
; PLAN: r0=285(x), r1=97(y), r2=80(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=142(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=191(x), r11=76(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 97
LDI r2, 80
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 142
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 191
LDI r11, 76
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
