; DESCRIPTION: Places a cyan dot at position (438, 52).
; PLAN: r0=438(x), r1=52(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 52
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
