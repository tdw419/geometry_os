; DESCRIPTION: Places a magenta circle of radius 48 at center (170, 140).
; PLAN: r0=170(x), r1=140(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 140
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
