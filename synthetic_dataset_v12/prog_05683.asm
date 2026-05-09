; DESCRIPTION: Composite: Creates a yellow rectangular region at (156, 122) spanning 36 by 34 pixels then Creates a magenta circular shape at (410, 59) with radius 18 then Sets a single blue pixel at (138, 2).
; PLAN: r0=156(x), r1=122(y), r2=36(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=59(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=138(x), r11=2(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 122
LDI r2, 36
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 59
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 138
LDI r11, 2
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
