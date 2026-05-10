; DESCRIPTION: Places a cyan dot at position (227, 18).
; PLAN: r0=227(x), r1=18(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 18
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
