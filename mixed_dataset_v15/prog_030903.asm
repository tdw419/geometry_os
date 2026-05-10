; DESCRIPTION: Composite: Renders a green line between points (333, 202) and (136, 22) then Draws a green circle centered at (62, 78) with radius 34.
; PLAN: r0=333(x1), r1=202(y1), r2=136(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=78(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 333
LDI r1, 202
LDI r2, 136
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 78
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
