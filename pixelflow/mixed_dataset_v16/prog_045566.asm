; DESCRIPTION: Places a cyan dot at position (140, 57).
; PLAN: r0=140(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
