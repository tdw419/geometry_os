; DESCRIPTION: Composite: Creates a orange rectangular region at (284, 6) spanning 28 by 106 pixels then Sets a single yellow pixel at (89, 249) then Draws a purple circle centered at (280, 64) with radius 51.
; PLAN: r0=284(x), r1=6(y), r2=28(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=249(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=280(x), r11=64(y), r12=51(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 6
LDI r2, 28
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 249
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 280
LDI r11, 64
LDI r12, 51
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
