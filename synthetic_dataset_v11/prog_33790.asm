; DESCRIPTION: Composite: . Then Places a yellow dot at position (130, 212). Then Places a blue circle of radius 44 at center (162, 180).
; PLAN: r0=130(x), r1=212(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=162(x), r1=180(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (130, 212).
; PLAN: r0=130(x), r1=212(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 212
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 44 at center (162, 180).
; PLAN: r0=162(x), r1=180(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 180
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
