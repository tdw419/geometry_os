; DESCRIPTION: Composite: Draws a green rectangle at (70, 16) with width 114 and height 83 then Renders a yellow disk with center (194, 133) and radius 26.
; PLAN: r0=70(x), r1=16(y), r2=114(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=133(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 16
LDI r2, 114
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 133
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
