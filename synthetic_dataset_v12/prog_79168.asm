; DESCRIPTION: Composite: Sets a single orange pixel at (290, 54) then Creates a blue rectangular region at (218, 13) spanning 64 by 64 pixels then Draws a yellow circle centered at (439, 181) with radius 33.
; PLAN: r0=290(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=13(y), r7=64(width), r8=64(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=181(y), r12=33(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 218
LDI r6, 13
LDI r7, 64
LDI r8, 64
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 181
LDI r12, 33
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
