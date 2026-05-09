; DESCRIPTION: Composite: Draws a red circle centered at (272, 152) with radius 52 then Creates a blue rectangular region at (122, 100) spanning 24 by 92 pixels then Places a green dot at position (96, 152).
; PLAN: r0=272(x), r1=152(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=100(y), r7=24(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=152(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 272
LDI r1, 152
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 100
LDI r7, 24
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 152
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
