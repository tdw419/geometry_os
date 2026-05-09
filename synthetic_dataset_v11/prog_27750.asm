; DESCRIPTION: Places a cyan dot at position (25, 85).
; PLAN: r0=25(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
