; DESCRIPTION: Places a magenta circle of radius 31 at center (120, 196).
; PLAN: r0=120(x), r1=196(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 196
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
