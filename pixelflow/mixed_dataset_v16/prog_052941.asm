; DESCRIPTION: Composite: Creates a purple rectangular region at (264, 108) spanning 33 by 74 pixels then Sets a single orange pixel at (279, 21) then Creates a orange circular shape at (127, 154) with radius 73.
; PLAN: r0=264(x), r1=108(y), r2=33(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=21(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=154(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 108
LDI r2, 33
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 21
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 127
LDI r11, 154
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
