; DESCRIPTION: Composite: . Then Renders a blue disk with center (158, 87) and radius 80. Then Renders a white line between points (120, 250) and (14, 243).
; PLAN: r0=158(x), r1=87(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x1), r1=250(y1), r2=14(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (158, 87) and radius 80.
; PLAN: r0=158(x), r1=87(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 87
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (120, 250) and (14, 243).
; PLAN: r0=120(x1), r1=250(y1), r2=14(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 250
LDI r2, 14
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
