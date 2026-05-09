; DESCRIPTION: Places a cyan dot at position (501, 72).
; PLAN: r0=501(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
