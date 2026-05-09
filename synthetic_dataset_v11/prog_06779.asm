; DESCRIPTION: Composite: . Then Creates a black circular shape at (28, 17) with radius 11. Then Renders a green line between points (28, 185) and (242, 130).
; PLAN: r0=28(x), r1=17(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=28(x1), r1=185(y1), r2=242(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (28, 17) with radius 11.
; PLAN: r0=28(x), r1=17(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 17
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (28, 185) and (242, 130).
; PLAN: r0=28(x1), r1=185(y1), r2=242(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 185
LDI r2, 242
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
