; DESCRIPTION: Creates a magenta circular shape at (338, 210) with radius 44.
; PLAN: r0=338(x), r1=210(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 210
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
