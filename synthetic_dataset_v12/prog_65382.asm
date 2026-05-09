; DESCRIPTION: Composite: Creates a magenta rectangular region at (211, 78) spanning 102 by 118 pixels then Draws a red circle centered at (110, 64) with radius 20 then Sets a single magenta pixel at (377, 255).
; PLAN: r0=211(x), r1=78(y), r2=102(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=64(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=255(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 78
LDI r2, 102
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 64
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 255
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
