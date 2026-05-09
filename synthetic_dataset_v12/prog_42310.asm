; DESCRIPTION: Composite: Places a red dot at position (272, 84) then Places a blue circle of radius 65 at center (365, 90) then Draws a white rectangle at (148, 155) with width 17 and height 59.
; PLAN: r0=272(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=90(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=155(y), r12=17(width), r13=59(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 365
LDI r6, 90
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 155
LDI r12, 17
LDI r13, 59
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
