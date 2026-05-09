; DESCRIPTION: Creates a magenta circular shape at (418, 108) with radius 52.
; PLAN: r0=418(x), r1=108(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 108
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
