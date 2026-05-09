; DESCRIPTION: Places a black circle of radius 62 at center (87, 166).
; PLAN: r0=87(x), r1=166(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 166
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
