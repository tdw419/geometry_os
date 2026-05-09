; DESCRIPTION: Composite: Draws a red line from (287, 130) to (279, 139) then Renders a orange disk with center (115, 110) and radius 77.
; PLAN: r0=287(x1), r1=130(y1), r2=279(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=110(y), r7=77(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 287
LDI r1, 130
LDI r2, 279
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 110
LDI r7, 77
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
