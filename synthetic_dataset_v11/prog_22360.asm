; DESCRIPTION: Composite: . Then Places a green circle of radius 41 at center (119, 196). Then Sets a single magenta pixel at (254, 127).
; PLAN: r0=119(x), r1=196(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green circle of radius 41 at center (119, 196).
; PLAN: r0=119(x), r1=196(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 196
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (254, 127).
; PLAN: r0=254(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
