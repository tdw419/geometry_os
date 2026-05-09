; DESCRIPTION: Places a black circle of radius 15 at center (229, 176).
; PLAN: r0=229(x), r1=176(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 176
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
