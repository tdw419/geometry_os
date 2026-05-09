; DESCRIPTION: Places a black circle of radius 75 at center (281, 131).
; PLAN: r0=281(x), r1=131(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 131
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
