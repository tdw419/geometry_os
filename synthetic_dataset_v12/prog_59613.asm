; DESCRIPTION: Composite: Creates a black rectangular region at (323, 93) spanning 12 by 59 pixels then Places a green dot at position (382, 252) then Draws a blue circle centered at (199, 110) with radius 45.
; PLAN: r0=323(x), r1=93(y), r2=12(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=252(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=110(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 93
LDI r2, 12
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 252
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 199
LDI r11, 110
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
