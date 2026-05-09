; DESCRIPTION: Composite: . Then Places a black circle of radius 33 at center (158, 63). Then Places a magenta dot at position (90, 200).
; PLAN: r0=158(x), r1=63(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=90(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 33 at center (158, 63).
; PLAN: r0=158(x), r1=63(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 63
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (90, 200).
; PLAN: r0=90(x), r1=200(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 200
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
