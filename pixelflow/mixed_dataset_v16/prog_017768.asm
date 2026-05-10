; DESCRIPTION: Composite: Renders a yellow line between points (494, 179) and (139, 157) then Draws a green rectangle at (224, 47) with width 33 and height 90.
; PLAN: r0=494(x1), r1=179(y1), r2=139(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=47(y), r7=33(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 179
LDI r2, 139
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 47
LDI r7, 33
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
