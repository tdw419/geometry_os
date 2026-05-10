; DESCRIPTION: Places a cyan dot at position (189, 176).
; PLAN: r0=189(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
