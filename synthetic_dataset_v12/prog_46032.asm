; DESCRIPTION: Places a black circle of radius 27 at center (375, 55).
; PLAN: r0=375(x), r1=55(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 55
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
