; DESCRIPTION: Places a black circle of radius 24 at center (440, 89).
; PLAN: r0=440(x), r1=89(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 89
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
