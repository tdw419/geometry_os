; DESCRIPTION: Creates a blue circular shape at (182, 51) with radius 39.
; PLAN: r0=182(x), r1=51(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 51
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
