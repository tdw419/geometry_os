; DESCRIPTION: Places a cyan dot at position (72, 72).
; PLAN: r0=72(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
