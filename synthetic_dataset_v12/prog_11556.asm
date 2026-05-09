; DESCRIPTION: Places a magenta circle of radius 18 at center (95, 100).
; PLAN: r0=95(x), r1=100(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 100
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
