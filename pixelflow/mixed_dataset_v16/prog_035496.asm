; DESCRIPTION: Places a cyan dot at position (321, 98).
; PLAN: r0=321(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
