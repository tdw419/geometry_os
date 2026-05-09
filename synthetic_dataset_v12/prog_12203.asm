; DESCRIPTION: Composite: Creates a magenta rectangular region at (155, 100) spanning 96 by 72 pixels then Places a magenta dot at position (18, 136) then Renders a green disk with center (51, 52) and radius 45.
; PLAN: r0=155(x), r1=100(y), r2=96(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=136(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=52(y), r12=45(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 155
LDI r1, 100
LDI r2, 96
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 136
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 52
LDI r12, 45
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
