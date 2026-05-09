; DESCRIPTION: Composite: Places a black circle of radius 33 at center (325, 36) then Sets a single blue pixel at (66, 168) then Places a yellow 87x72 rectangle at position (269, 49).
; PLAN: r0=325(x), r1=36(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=168(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=269(x), r11=49(y), r12=87(width), r13=72(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 36
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 168
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 269
LDI r11, 49
LDI r12, 87
LDI r13, 72
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
