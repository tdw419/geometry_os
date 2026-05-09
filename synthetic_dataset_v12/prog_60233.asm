; DESCRIPTION: Composite: Creates a green circular shape at (421, 194) with radius 40 then Sets a single blue pixel at (247, 173) then Places a blue 56x15 rectangle at position (11, 178).
; PLAN: r0=421(x), r1=194(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=247(x), r6=173(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=11(x), r11=178(y), r12=56(width), r13=15(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 194
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 247
LDI r6, 173
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 11
LDI r11, 178
LDI r12, 56
LDI r13, 15
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
