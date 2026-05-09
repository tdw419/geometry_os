; DESCRIPTION: Places a black circle of radius 44 at center (346, 199).
; PLAN: r0=346(x), r1=199(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 199
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
