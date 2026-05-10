; DESCRIPTION: Composite: Draws a white rectangle at (52, 145) with width 113 and height 83 then Renders a green disk with center (366, 52) and radius 44.
; PLAN: r0=52(x), r1=145(y), r2=113(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=52(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 145
LDI r2, 113
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 52
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
