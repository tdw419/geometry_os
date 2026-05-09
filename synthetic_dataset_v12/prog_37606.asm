; DESCRIPTION: Composite: Draws a black circle centered at (113, 86) with radius 48 then Sets a single purple pixel at (217, 204) then Creates a white rectangular region at (64, 137) spanning 25 by 18 pixels.
; PLAN: r0=113(x), r1=86(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=204(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=64(x), r11=137(y), r12=25(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 86
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 204
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 64
LDI r11, 137
LDI r12, 25
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
