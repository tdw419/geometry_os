; DESCRIPTION: Draws a black circle centered at (405, 131) with radius 53.
; PLAN: r0=405(x), r1=131(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 131
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
