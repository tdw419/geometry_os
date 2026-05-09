; DESCRIPTION: Places a cyan dot at position (319, 56).
; PLAN: r0=319(x), r1=56(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 319
LDI r1, 56
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
