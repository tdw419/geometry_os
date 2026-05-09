; DESCRIPTION: Places a cyan dot at position (367, 97).
; PLAN: r0=367(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 97
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
