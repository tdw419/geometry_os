; DESCRIPTION: Places a black circle of radius 36 at center (175, 137).
; PLAN: r0=175(x), r1=137(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 137
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
