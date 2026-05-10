; DESCRIPTION: Composite: Draws a orange circle centered at (373, 33) with radius 21 then Creates a magenta rectangular region at (391, 100) spanning 74 by 34 pixels then Places a yellow dot at position (388, 155).
; PLAN: r0=373(x), r1=33(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=100(y), r7=74(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=155(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 33
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 100
LDI r7, 74
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 155
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
