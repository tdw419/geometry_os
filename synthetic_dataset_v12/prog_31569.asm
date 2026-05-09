; DESCRIPTION: Places a black circle of radius 27 at center (359, 102).
; PLAN: r0=359(x), r1=102(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 102
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
