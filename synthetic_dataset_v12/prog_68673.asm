; DESCRIPTION: Places a cyan dot at position (417, 238).
; PLAN: r0=417(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
