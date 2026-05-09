; DESCRIPTION: Places a cyan dot at position (11, 181).
; PLAN: r0=11(x), r1=181(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 181
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
