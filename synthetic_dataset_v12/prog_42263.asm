; DESCRIPTION: Places a cyan circle of radius 22 at center (361, 60).
; PLAN: r0=361(x), r1=60(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 60
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
