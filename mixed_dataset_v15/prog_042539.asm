; DESCRIPTION: Composite: Sets a single blue pixel at (126, 70) then Places a magenta circle of radius 56 at center (135, 171) then Draws a orange rectangle at (293, 128) with width 109 and height 77.
; PLAN: r0=126(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=171(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=128(y), r12=109(width), r13=77(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 135
LDI r6, 171
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 128
LDI r12, 109
LDI r13, 77
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
