; DESCRIPTION: Composite: Creates a white rectangular region at (234, 28) spanning 87 by 12 pixels then Sets a single purple pixel at (20, 47) then Renders a orange disk with center (163, 199) and radius 47.
; PLAN: r0=234(x), r1=28(y), r2=87(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=47(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=199(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 28
LDI r2, 87
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 47
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 163
LDI r11, 199
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
