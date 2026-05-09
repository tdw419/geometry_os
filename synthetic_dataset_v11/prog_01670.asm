; DESCRIPTION: Composite: . Then Places a green circle of radius 12 at center (64, 153). Then Renders a purple line between points (55, 50) and (242, 119).
; PLAN: r0=64(x), r1=153(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=50(y1), r2=242(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 12 at center (64, 153).
; PLAN: r0=64(x), r1=153(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 153
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (55, 50) and (242, 119).
; PLAN: r0=55(x1), r1=50(y1), r2=242(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 50
LDI r2, 242
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
