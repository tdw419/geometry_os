; DESCRIPTION: Places a cyan dot at position (266, 132).
; PLAN: r0=266(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
