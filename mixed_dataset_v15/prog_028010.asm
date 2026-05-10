; DESCRIPTION: Places a black circle of radius 65 at center (87, 83).
; PLAN: r0=87(x), r1=83(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 83
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
