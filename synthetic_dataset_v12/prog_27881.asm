; DESCRIPTION: Composite: Places a blue circle of radius 22 at center (174, 98) then Places a cyan dot at position (454, 146) then Draws a green rectangle at (312, 102) with width 24 and height 109.
; PLAN: r0=174(x), r1=98(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=146(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=102(y), r12=24(width), r13=109(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 98
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 146
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 312
LDI r11, 102
LDI r12, 24
LDI r13, 109
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
