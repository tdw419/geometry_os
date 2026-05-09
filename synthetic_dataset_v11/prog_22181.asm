; DESCRIPTION: Places a cyan dot at position (55, 216).
; PLAN: r0=55(x), r1=216(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 216
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
