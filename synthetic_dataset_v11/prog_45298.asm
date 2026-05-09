; DESCRIPTION: Places a magenta circle of radius 48 at center (145, 76).
; PLAN: r0=145(x), r1=76(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 76
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
