; DESCRIPTION: Places a cyan dot at position (41, 33).
; PLAN: r0=41(x), r1=33(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 33
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
