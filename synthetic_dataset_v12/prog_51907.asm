; DESCRIPTION: Places a magenta circle of radius 52 at center (329, 196).
; PLAN: r0=329(x), r1=196(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 196
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
