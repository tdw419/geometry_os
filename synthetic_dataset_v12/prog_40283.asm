; DESCRIPTION: Places a magenta circle of radius 70 at center (389, 115).
; PLAN: r0=389(x), r1=115(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 115
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
