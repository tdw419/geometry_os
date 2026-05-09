; DESCRIPTION: Composite: Renders a blue box of size 76x109 starting at (391, 118) then Places a blue dot at position (402, 250) then Places a white circle of radius 67 at center (240, 102).
; PLAN: r0=391(x), r1=118(y), r2=76(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=250(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=102(y), r12=67(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 118
LDI r2, 76
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 250
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 240
LDI r11, 102
LDI r12, 67
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
