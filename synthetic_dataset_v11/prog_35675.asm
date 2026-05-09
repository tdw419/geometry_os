; DESCRIPTION: Places a cyan dot at position (149, 194).
; PLAN: r0=149(x), r1=194(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 149
LDI r1, 194
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
