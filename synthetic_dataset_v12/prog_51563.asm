; DESCRIPTION: Composite: Renders a magenta line between points (85, 77) and (274, 136) then Renders a green box of size 97x20 starting at (244, 90).
; PLAN: r0=85(x1), r1=77(y1), r2=274(x2), r3=136(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=90(y), r7=97(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 77
LDI r2, 274
LDI r3, 136
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 90
LDI r7, 97
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
