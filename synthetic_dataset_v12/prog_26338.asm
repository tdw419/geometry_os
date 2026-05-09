; DESCRIPTION: Places a cyan dot at position (405, 226).
; PLAN: r0=405(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
