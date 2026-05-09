; DESCRIPTION: Places a cyan dot at position (183, 241).
; PLAN: r0=183(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
