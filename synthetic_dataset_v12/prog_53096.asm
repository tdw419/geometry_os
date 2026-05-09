; DESCRIPTION: Places a magenta circle of radius 21 at center (148, 200).
; PLAN: r0=148(x), r1=200(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 200
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
