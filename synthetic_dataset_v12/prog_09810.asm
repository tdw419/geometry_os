; DESCRIPTION: Composite: Places a orange circle of radius 29 at center (207, 48) then Sets a single cyan pixel at (181, 59) then Creates a magenta rectangular region at (185, 54) spanning 115 by 94 pixels.
; PLAN: r0=207(x), r1=48(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=185(x), r11=54(y), r12=115(width), r13=94(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 48
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 185
LDI r11, 54
LDI r12, 115
LDI r13, 94
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
