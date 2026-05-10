; DESCRIPTION: Creates a cyan circular shape at (98, 202) with radius 41.
; PLAN: r0=98(x), r1=202(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 202
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
