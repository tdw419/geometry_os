; DESCRIPTION: Composite: Creates a green rectangular region at (294, 4) spanning 88 by 100 pixels then Places a yellow circle of radius 31 at center (282, 181) then Places a blue dot at position (429, 141).
; PLAN: r0=294(x), r1=4(y), r2=88(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=181(y), r7=31(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x), r11=141(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 4
LDI r2, 88
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 181
LDI r7, 31
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 141
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
