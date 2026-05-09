; DESCRIPTION: Composite: . Then Renders a white disk with center (149, 134) and radius 40. Then Renders a magenta line between points (12, 89) and (55, 5).
; PLAN: r0=149(x), r1=134(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x1), r1=89(y1), r2=55(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (149, 134) and radius 40.
; PLAN: r0=149(x), r1=134(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 134
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (12, 89) and (55, 5).
; PLAN: r0=12(x1), r1=89(y1), r2=55(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 89
LDI r2, 55
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
