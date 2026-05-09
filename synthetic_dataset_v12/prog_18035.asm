; DESCRIPTION: Places a cyan dot at position (14, 158).
; PLAN: r0=14(x), r1=158(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 158
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
