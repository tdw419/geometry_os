; DESCRIPTION: Composite: Creates a red circular shape at (112, 19) with radius 10 then Sets a single yellow pixel at (185, 11) then Places a yellow 26x63 rectangle at position (261, 178).
; PLAN: r0=112(x), r1=19(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=185(x), r6=11(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=178(y), r12=26(width), r13=63(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 19
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 185
LDI r6, 11
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 261
LDI r11, 178
LDI r12, 26
LDI r13, 63
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
