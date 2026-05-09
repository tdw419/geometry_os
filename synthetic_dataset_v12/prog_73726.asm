; DESCRIPTION: Composite: Places a black dot at position (97, 100) then Draws a blue circle centered at (359, 156) with radius 80 then Creates a yellow rectangular region at (218, 6) spanning 51 by 60 pixels.
; PLAN: r0=97(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=156(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=6(y), r12=51(width), r13=60(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 359
LDI r6, 156
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 6
LDI r12, 51
LDI r13, 60
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
