; DESCRIPTION: Places a cyan dot at position (138, 205).
; PLAN: r0=138(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 205
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
