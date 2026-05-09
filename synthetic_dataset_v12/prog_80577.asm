; DESCRIPTION: Places a cyan dot at position (4, 216).
; PLAN: r0=4(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
