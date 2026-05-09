; DESCRIPTION: Creates a cyan circular shape at (60, 125) with radius 41.
; PLAN: r0=60(x), r1=125(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 125
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
