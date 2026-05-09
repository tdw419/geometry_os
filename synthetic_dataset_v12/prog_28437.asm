; DESCRIPTION: Composite: Creates a magenta rectangular region at (109, 87) spanning 72 by 18 pixels then Renders a orange disk with center (188, 136) and radius 32 then Sets a single blue pixel at (455, 146).
; PLAN: r0=109(x), r1=87(y), r2=72(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x), r6=136(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=455(x), r11=146(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 87
LDI r2, 72
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 136
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 455
LDI r11, 146
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
