; DESCRIPTION: Composite: Places a cyan dot at position (143, 211) then Places a blue circle of radius 20 at center (159, 178) then Creates a red rectangular region at (232, 170) spanning 13 by 84 pixels.
; PLAN: r0=143(x), r1=211(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=178(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x), r11=170(y), r12=13(width), r13=84(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 211
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 159
LDI r6, 178
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 170
LDI r12, 13
LDI r13, 84
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
