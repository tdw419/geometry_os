; DESCRIPTION: Composite: . Then Renders a cyan disk with center (201, 199) and radius 28. Then Renders a purple line between points (243, 164) and (110, 136).
; PLAN: r0=201(x), r1=199(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=243(x1), r1=164(y1), r2=110(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (201, 199) and radius 28.
; PLAN: r0=201(x), r1=199(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 199
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (243, 164) and (110, 136).
; PLAN: r0=243(x1), r1=164(y1), r2=110(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 164
LDI r2, 110
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
