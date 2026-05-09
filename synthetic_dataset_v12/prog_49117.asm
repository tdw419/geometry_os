; DESCRIPTION: Places a cyan dot at position (13, 106).
; PLAN: r0=13(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
