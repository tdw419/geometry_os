; DESCRIPTION: Composite: Creates a blue circular shape at (198, 156) with radius 48 then Renders a green line between points (112, 185) and (78, 95).
; PLAN: r0=198(x), r1=156(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=185(y1), r7=78(x2), r8=95(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 156
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 185
LDI r7, 78
LDI r8, 95
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
