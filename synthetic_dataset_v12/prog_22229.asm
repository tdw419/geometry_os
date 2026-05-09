; DESCRIPTION: Places a cyan dot at position (325, 211).
; PLAN: r0=325(x), r1=211(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 211
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
