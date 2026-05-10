; DESCRIPTION: Composite: Places a blue circle of radius 11 at center (441, 18) then Sets a single blue pixel at (201, 223) then Places a blue 25x63 rectangle at position (71, 105).
; PLAN: r0=441(x), r1=18(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=223(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=71(x), r11=105(y), r12=25(width), r13=63(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 18
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 223
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 71
LDI r11, 105
LDI r12, 25
LDI r13, 63
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
