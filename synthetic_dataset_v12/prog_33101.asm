; DESCRIPTION: Places a cyan circle of radius 74 at center (257, 137).
; PLAN: r0=257(x), r1=137(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 137
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
