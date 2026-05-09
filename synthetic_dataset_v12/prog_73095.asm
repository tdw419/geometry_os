; DESCRIPTION: Composite: Draws a white rectangle at (73, 98) with width 50 and height 119 then Renders a yellow line between points (153, 156) and (45, 33).
; PLAN: r0=73(x), r1=98(y), r2=50(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=153(x1), r6=156(y1), r7=45(x2), r8=33(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 98
LDI r2, 50
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 156
LDI r7, 45
LDI r8, 33
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
