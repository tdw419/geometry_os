; DESCRIPTION: Composite: Renders a orange box of size 13x92 starting at (422, 123) then Sets a single green pixel at (434, 191) then Creates a green circular shape at (383, 181) with radius 36.
; PLAN: r0=422(x), r1=123(y), r2=13(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=191(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=181(y), r12=36(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 123
LDI r2, 13
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 191
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 383
LDI r11, 181
LDI r12, 36
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
