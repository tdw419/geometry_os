; DESCRIPTION: Composite: Sets a single magenta pixel at (420, 191) then Renders a orange disk with center (346, 30) and radius 17 then Draws a magenta rectangle at (357, 163) with width 103 and height 93.
; PLAN: r0=420(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=30(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x), r11=163(y), r12=103(width), r13=93(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 30
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 163
LDI r12, 103
LDI r13, 93
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
