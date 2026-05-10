; DESCRIPTION: Composite: Creates a white rectangular region at (294, 134) spanning 62 by 52 pixels then Renders a black disk with center (315, 144) and radius 69 then Sets a single magenta pixel at (149, 254).
; PLAN: r0=294(x), r1=134(y), r2=62(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=144(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=254(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 134
LDI r2, 62
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 144
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 254
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
