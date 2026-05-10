; DESCRIPTION: Places a cyan dot at position (31, 182).
; PLAN: r0=31(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
