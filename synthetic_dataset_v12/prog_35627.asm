; DESCRIPTION: Creates a purple circular shape at (329, 126) with radius 21.
; PLAN: r0=329(x), r1=126(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 126
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
