; DESCRIPTION: Composite: . Then Places a blue circle of radius 51 at center (95, 93). Then Sets a single green pixel at (43, 136).
; PLAN: r0=95(x), r1=93(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=43(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue circle of radius 51 at center (95, 93).
; PLAN: r0=95(x), r1=93(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 93
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (43, 136).
; PLAN: r0=43(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
