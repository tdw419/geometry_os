; DESCRIPTION: Composite: Places a cyan 10x88 rectangle at position (319, 21) then Sets a single blue pixel at (329, 237) then Creates a red circular shape at (92, 135) with radius 66.
; PLAN: r0=319(x), r1=21(y), r2=10(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=237(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=135(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 21
LDI r2, 10
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 237
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 135
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
