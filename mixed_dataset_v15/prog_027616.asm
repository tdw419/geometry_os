; DESCRIPTION: Composite: Sets a single yellow pixel at (264, 181) then Draws a green circle centered at (283, 132) with radius 59 then Renders a white box of size 37x62 starting at (203, 96).
; PLAN: r0=264(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=132(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=96(y), r12=37(width), r13=62(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 283
LDI r6, 132
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 96
LDI r12, 37
LDI r13, 62
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
