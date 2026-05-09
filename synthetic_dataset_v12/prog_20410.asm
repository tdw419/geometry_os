; DESCRIPTION: Places a cyan dot at position (15, 73).
; PLAN: r0=15(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
