; DESCRIPTION: Composite: Creates a magenta rectangular region at (65, 33) spanning 77 by 100 pixels then Renders a black disk with center (347, 91) and radius 28 then Sets a single yellow pixel at (257, 24).
; PLAN: r0=65(x), r1=33(y), r2=77(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x), r6=91(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=24(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 33
LDI r2, 77
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 91
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 24
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
