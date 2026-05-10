; DESCRIPTION: Composite: Renders a white disk with center (149, 92) and radius 79 then Draws a red rectangle at (396, 131) with width 72 and height 75 then Sets a single yellow pixel at (334, 90).
; PLAN: r0=149(x), r1=92(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=131(y), r7=72(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=90(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 92
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 131
LDI r7, 72
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 90
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
