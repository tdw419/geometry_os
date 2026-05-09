; DESCRIPTION: Places a black circle of radius 23 at center (327, 164).
; PLAN: r0=327(x), r1=164(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 164
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
