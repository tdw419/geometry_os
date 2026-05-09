; DESCRIPTION: Composite: Creates a blue circular shape at (80, 184) with radius 68 then Draws a purple rectangle at (423, 106) with width 37 and height 71.
; PLAN: r0=80(x), r1=184(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=106(y), r7=37(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 184
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 106
LDI r7, 37
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
