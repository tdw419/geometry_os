; DESCRIPTION: Composite: Draws a green circle centered at (135, 132) with radius 26 then Creates a red rectangular region at (407, 145) spanning 83 by 71 pixels then Sets a single blue pixel at (73, 56).
; PLAN: r0=135(x), r1=132(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=145(y), r7=83(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=56(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 132
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 145
LDI r7, 83
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 56
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
