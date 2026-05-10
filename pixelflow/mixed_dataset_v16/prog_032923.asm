; DESCRIPTION: Composite: Creates a green circular shape at (329, 133) with radius 41 then Sets a single purple pixel at (421, 32) then Creates a green rectangular region at (423, 117) spanning 64 by 80 pixels.
; PLAN: r0=329(x), r1=133(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x), r6=32(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=117(y), r12=64(width), r13=80(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 133
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 32
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 423
LDI r11, 117
LDI r12, 64
LDI r13, 80
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
