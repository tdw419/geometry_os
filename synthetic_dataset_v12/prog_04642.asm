; DESCRIPTION: Composite: Places a purple 78x19 rectangle at position (174, 204) then Sets a single orange pixel at (347, 191) then Draws a orange circle centered at (298, 128) with radius 56.
; PLAN: r0=174(x), r1=204(y), r2=78(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=191(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=128(y), r12=56(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 204
LDI r2, 78
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 191
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 298
LDI r11, 128
LDI r12, 56
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
