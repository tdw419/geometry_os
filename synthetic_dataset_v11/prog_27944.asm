; DESCRIPTION: Composite: . Then Renders a black line between points (100, 23) and (141, 192). Then Renders a purple disk with center (184, 157) and radius 53.
; PLAN: r0=100(x1), r1=23(y1), r2=141(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=184(x), r1=157(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (100, 23) and (141, 192).
; PLAN: r0=100(x1), r1=23(y1), r2=141(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 23
LDI r2, 141
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (184, 157) and radius 53.
; PLAN: r0=184(x), r1=157(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 157
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
