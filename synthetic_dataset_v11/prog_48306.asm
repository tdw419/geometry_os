; DESCRIPTION: Composite: . Then Places a purple circle of radius 48 at center (73, 76). Then Renders a black line between points (49, 226) and (190, 153).
; PLAN: r0=73(x), r1=76(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x1), r1=226(y1), r2=190(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 48 at center (73, 76).
; PLAN: r0=73(x), r1=76(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 76
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (49, 226) and (190, 153).
; PLAN: r0=49(x1), r1=226(y1), r2=190(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 226
LDI r2, 190
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
