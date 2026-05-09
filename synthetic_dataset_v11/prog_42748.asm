; DESCRIPTION: Composite: . Then Renders a blue disk with center (177, 105) and radius 78. Then Renders a orange line between points (0, 158) and (173, 97).
; PLAN: r0=177(x), r1=105(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=0(x1), r1=158(y1), r2=173(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (177, 105) and radius 78.
; PLAN: r0=177(x), r1=105(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 105
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange line between points (0, 158) and (173, 97).
; PLAN: r0=0(x1), r1=158(y1), r2=173(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 158
LDI r2, 173
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
