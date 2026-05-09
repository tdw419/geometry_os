; DESCRIPTION: Composite: Draws a green rectangle at (133, 139) with width 106 and height 88 then Renders a cyan disk with center (192, 77) and radius 65.
; PLAN: r0=133(x), r1=139(y), r2=106(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=77(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 139
LDI r2, 106
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 77
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
