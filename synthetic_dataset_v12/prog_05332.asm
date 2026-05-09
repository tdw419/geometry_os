; DESCRIPTION: Places a cyan dot at position (194, 94).
; PLAN: r0=194(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
