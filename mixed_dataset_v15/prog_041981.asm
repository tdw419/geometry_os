; DESCRIPTION: Places a cyan dot at position (212, 119).
; PLAN: r0=212(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
