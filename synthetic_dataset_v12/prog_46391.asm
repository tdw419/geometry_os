; DESCRIPTION: Places a black circle of radius 75 at center (309, 167).
; PLAN: r0=309(x), r1=167(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 167
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
