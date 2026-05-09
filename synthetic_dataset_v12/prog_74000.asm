; DESCRIPTION: Places a black circle of radius 44 at center (74, 52).
; PLAN: r0=74(x), r1=52(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 52
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
