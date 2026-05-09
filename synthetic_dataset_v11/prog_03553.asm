; DESCRIPTION: Composite: . Then Renders a black line between points (14, 42) and (177, 114). Then Renders a purple disk with center (89, 68) and radius 61.
; PLAN: r0=14(x1), r1=42(y1), r2=177(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=89(x), r1=68(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (14, 42) and (177, 114).
; PLAN: r0=14(x1), r1=42(y1), r2=177(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 42
LDI r2, 177
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (89, 68) and radius 61.
; PLAN: r0=89(x), r1=68(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 68
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
