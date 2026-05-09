; DESCRIPTION: Places a cyan dot at position (78, 102).
; PLAN: r0=78(x), r1=102(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 102
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
