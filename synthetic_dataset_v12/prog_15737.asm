; DESCRIPTION: Composite: Draws a yellow circle centered at (156, 89) with radius 63 then Creates a cyan rectangular region at (79, 43) spanning 19 by 20 pixels.
; PLAN: r0=156(x), r1=89(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=43(y), r7=19(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 89
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 43
LDI r7, 19
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
