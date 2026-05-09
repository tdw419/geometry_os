; DESCRIPTION: Places a cyan circle of radius 32 at center (49, 41).
; PLAN: r0=49(x), r1=41(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 41
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
