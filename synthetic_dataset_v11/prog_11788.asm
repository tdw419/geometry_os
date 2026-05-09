; DESCRIPTION: Composite: . Then Renders a orange disk with center (121, 99) and radius 49. Then Places a magenta dot at position (215, 84).
; PLAN: r0=121(x), r1=99(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=215(x), r1=84(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (121, 99) and radius 49.
; PLAN: r0=121(x), r1=99(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 99
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta dot at position (215, 84).
; PLAN: r0=215(x), r1=84(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 84
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
