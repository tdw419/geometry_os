; DESCRIPTION: Creates a blue circular shape at (180, 183) with radius 33.
; PLAN: r0=180(x), r1=183(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 183
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
