; DESCRIPTION: Places a black circle of radius 56 at center (144, 103).
; PLAN: r0=144(x), r1=103(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 103
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
