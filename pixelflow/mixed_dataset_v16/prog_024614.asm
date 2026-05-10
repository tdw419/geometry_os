; DESCRIPTION: Creates a purple circular shape at (460, 203) with radius 39.
; PLAN: r0=460(x), r1=203(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 203
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
