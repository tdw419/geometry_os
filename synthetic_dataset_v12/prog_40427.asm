; DESCRIPTION: Places a cyan dot at position (334, 0).
; PLAN: r0=334(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
