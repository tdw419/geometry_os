; DESCRIPTION: Places a magenta circle of radius 31 at center (45, 65).
; PLAN: r0=45(x), r1=65(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 65
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
