; DESCRIPTION: Composite: . Then Draws a cyan line from (149, 9) to (147, 130). Then Renders a blue disk with center (211, 211) and radius 38.
; PLAN: r0=149(x1), r1=9(y1), r2=147(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=211(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (149, 9) to (147, 130).
; PLAN: r0=149(x1), r1=9(y1), r2=147(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 9
LDI r2, 147
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (211, 211) and radius 38.
; PLAN: r0=211(x), r1=211(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 211
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
