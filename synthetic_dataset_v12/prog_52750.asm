; DESCRIPTION: Places a purple circle of radius 27 at center (332, 36).
; PLAN: r0=332(x), r1=36(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 36
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
