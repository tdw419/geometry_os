; DESCRIPTION: Places a black circle of radius 27 at center (134, 178).
; PLAN: r0=134(x), r1=178(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 178
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
