; DESCRIPTION: Composite: Places a red circle of radius 72 at center (211, 89) then Sets a single magenta pixel at (371, 150) then Draws a magenta rectangle at (204, 200) with width 66 and height 55.
; PLAN: r0=211(x), r1=89(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=150(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=200(y), r12=66(width), r13=55(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 89
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 150
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 200
LDI r12, 66
LDI r13, 55
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
