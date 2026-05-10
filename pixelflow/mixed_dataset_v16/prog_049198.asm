; DESCRIPTION: Composite: Draws a blue circle centered at (462, 176) with radius 25 then Renders a cyan line between points (242, 34) and (88, 13).
; PLAN: r0=462(x), r1=176(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x1), r6=34(y1), r7=88(x2), r8=13(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 176
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 34
LDI r7, 88
LDI r8, 13
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
