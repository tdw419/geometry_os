; DESCRIPTION: Composite: Creates a yellow rectangular region at (164, 106) spanning 88 by 52 pixels then Places a red circle of radius 37 at center (68, 153) then Places a white dot at position (335, 136).
; PLAN: r0=164(x), r1=106(y), r2=88(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=153(y), r7=37(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x), r11=136(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 106
LDI r2, 88
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 153
LDI r7, 37
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 136
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
