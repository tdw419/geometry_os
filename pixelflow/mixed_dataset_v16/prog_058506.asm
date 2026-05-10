; DESCRIPTION: Composite: Draws a magenta circle centered at (331, 110) with radius 60 then Creates a yellow rectangular region at (77, 128) spanning 95 by 13 pixels then Places a purple dot at position (259, 222).
; PLAN: r0=331(x), r1=110(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=77(x), r6=128(y), r7=95(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=222(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 110
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 77
LDI r6, 128
LDI r7, 95
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 222
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
