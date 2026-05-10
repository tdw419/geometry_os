; DESCRIPTION: Creates a cyan diamond shape using 4 lines meeting at the center.
; PLAN: r0=41(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
