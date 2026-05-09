; DESCRIPTION: Composite: Draws a yellow line from (97, 54) to (130, 112) then Renders a blue disk with center (359, 87) and radius 65.
; PLAN: r0=97(x1), r1=54(y1), r2=130(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=87(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 54
LDI r2, 130
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 87
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
