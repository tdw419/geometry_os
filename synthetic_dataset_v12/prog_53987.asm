; DESCRIPTION: Places a black circle of radius 28 at center (348, 113).
; PLAN: r0=348(x), r1=113(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 113
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
