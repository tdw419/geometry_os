; DESCRIPTION: Composite: Draws a magenta circle centered at (241, 112) with radius 65 then Creates a yellow rectangular region at (471, 13) spanning 38 by 63 pixels then Places a yellow dot at position (56, 153).
; PLAN: r0=241(x), r1=112(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x), r6=13(y), r7=38(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=153(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 112
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 13
LDI r7, 38
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 153
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
