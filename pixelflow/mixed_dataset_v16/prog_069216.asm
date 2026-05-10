; DESCRIPTION: Places a black circle of radius 14 at center (219, 117).
; PLAN: r0=219(x), r1=117(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 117
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
