; DESCRIPTION: Places a black circle of radius 10 at center (154, 66).
; PLAN: r0=154(x), r1=66(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 66
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
