; DESCRIPTION: Composite: . Then Renders a blue disk with center (106, 87) and radius 50. Then Renders a white line between points (149, 148) and (181, 202).
; PLAN: r0=106(x), r1=87(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=149(x1), r1=148(y1), r2=181(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (106, 87) and radius 50.
; PLAN: r0=106(x), r1=87(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 87
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (149, 148) and (181, 202).
; PLAN: r0=149(x1), r1=148(y1), r2=181(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 148
LDI r2, 181
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
