; DESCRIPTION: Places a cyan dot at position (167, 81).
; PLAN: r0=167(x), r1=81(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 81
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
