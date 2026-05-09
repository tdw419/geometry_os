; DESCRIPTION: Composite: Sets a single magenta pixel at (359, 188) then Creates a green circular shape at (159, 130) with radius 48 then Draws a white rectangle at (332, 27) with width 107 and height 22.
; PLAN: r0=359(x), r1=188(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=130(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x), r11=27(y), r12=107(width), r13=22(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 188
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 130
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 27
LDI r12, 107
LDI r13, 22
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
