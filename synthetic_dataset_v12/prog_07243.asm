; DESCRIPTION: Places a cyan dot at position (276, 141).
; PLAN: r0=276(x), r1=141(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 141
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
