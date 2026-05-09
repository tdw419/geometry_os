; DESCRIPTION: Places a black circle of radius 44 at center (345, 171).
; PLAN: r0=345(x), r1=171(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 171
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
