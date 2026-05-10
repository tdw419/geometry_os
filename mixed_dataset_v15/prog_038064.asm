; DESCRIPTION: Composite: Draws a magenta circle centered at (272, 166) with radius 79 then Sets a single cyan pixel at (355, 77) then Draws a orange rectangle at (160, 145) with width 31 and height 83.
; PLAN: r0=272(x), r1=166(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=77(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=145(y), r12=31(width), r13=83(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 166
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 77
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 160
LDI r11, 145
LDI r12, 31
LDI r13, 83
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
