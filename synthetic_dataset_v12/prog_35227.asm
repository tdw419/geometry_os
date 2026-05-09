; DESCRIPTION: Composite: Renders a orange disk with center (370, 170) and radius 67 then Draws a white rectangle at (350, 38) with width 115 and height 118 then Places a magenta dot at position (59, 194).
; PLAN: r0=370(x), r1=170(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=38(y), r7=115(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=194(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 170
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 38
LDI r7, 115
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 194
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
