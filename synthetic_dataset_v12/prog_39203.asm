; DESCRIPTION: Places a magenta circle of radius 52 at center (456, 80).
; PLAN: r0=456(x), r1=80(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 80
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
