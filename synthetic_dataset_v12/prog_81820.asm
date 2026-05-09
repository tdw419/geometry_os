; DESCRIPTION: Composite: Creates a magenta rectangular region at (72, 32) spanning 50 by 104 pixels then Sets a single blue pixel at (358, 153) then Draws a magenta circle centered at (231, 137) with radius 60.
; PLAN: r0=72(x), r1=32(y), r2=50(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=231(x), r11=137(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 32
LDI r2, 50
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 231
LDI r11, 137
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
