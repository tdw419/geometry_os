; DESCRIPTION: Creates a purple circular shape at (429, 209) with radius 15.
; PLAN: r0=429(x), r1=209(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 209
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
