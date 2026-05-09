; DESCRIPTION: Composite: . Then Places a red dot at position (191, 84). Then Places a magenta circle of radius 48 at center (85, 98).
; PLAN: r0=191(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=85(x), r1=98(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (191, 84).
; PLAN: r0=191(x), r1=84(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 84
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 48 at center (85, 98).
; PLAN: r0=85(x), r1=98(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 98
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
