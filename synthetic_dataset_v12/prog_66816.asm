; DESCRIPTION: Places a cyan dot at position (427, 217).
; PLAN: r0=427(x), r1=217(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 427
LDI r1, 217
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
