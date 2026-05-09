; DESCRIPTION: Composite: . Then Renders a white line between points (205, 35) and (176, 212). Then Renders a yellow disk with center (211, 189) and radius 15.
; PLAN: r0=205(x1), r1=35(y1), r2=176(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=189(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (205, 35) and (176, 212).
; PLAN: r0=205(x1), r1=35(y1), r2=176(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 35
LDI r2, 176
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (211, 189) and radius 15.
; PLAN: r0=211(x), r1=189(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 189
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
