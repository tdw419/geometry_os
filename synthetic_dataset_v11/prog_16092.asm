; DESCRIPTION: Places a cyan circle of radius 73 at center (85, 122).
; PLAN: r0=85(x), r1=122(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 122
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
