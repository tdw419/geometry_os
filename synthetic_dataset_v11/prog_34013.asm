; DESCRIPTION: Places a black circle of radius 54 at center (117, 63).
; PLAN: r0=117(x), r1=63(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 63
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
