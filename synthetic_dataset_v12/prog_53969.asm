; DESCRIPTION: Places a cyan dot at position (508, 130).
; PLAN: r0=508(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 508
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
