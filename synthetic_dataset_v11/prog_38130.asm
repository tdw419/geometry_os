; DESCRIPTION: Composite: . Then Renders a orange line between points (160, 2) and (191, 81). Then Renders a orange disk with center (189, 68) and radius 26.
; PLAN: r0=160(x1), r1=2(y1), r2=191(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=189(x), r1=68(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (160, 2) and (191, 81).
; PLAN: r0=160(x1), r1=2(y1), r2=191(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 2
LDI r2, 191
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (189, 68) and radius 26.
; PLAN: r0=189(x), r1=68(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 68
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
