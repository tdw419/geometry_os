; DESCRIPTION: Composite: Draws a purple circle centered at (108, 85) with radius 75 then Creates a cyan rectangular region at (269, 14) spanning 106 by 114 pixels then Sets a single magenta pixel at (86, 196).
; PLAN: r0=108(x), r1=85(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=14(y), r7=106(width), r8=114(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x), r11=196(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 85
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 14
LDI r7, 106
LDI r8, 114
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 196
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
