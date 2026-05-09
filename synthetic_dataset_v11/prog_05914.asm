; DESCRIPTION: Places a magenta circle of radius 73 at center (83, 91).
; PLAN: r0=83(x), r1=91(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 91
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
