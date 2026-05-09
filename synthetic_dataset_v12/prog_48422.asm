; DESCRIPTION: Places a purple circle of radius 16 at center (426, 239).
; PLAN: r0=426(x), r1=239(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 239
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
