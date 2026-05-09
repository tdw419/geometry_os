; DESCRIPTION: Places a cyan dot at position (329, 93).
; PLAN: r0=329(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
