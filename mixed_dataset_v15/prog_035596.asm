; DESCRIPTION: Places a black circle of radius 21 at center (123, 204).
; PLAN: r0=123(x), r1=204(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 204
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
