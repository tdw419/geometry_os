; DESCRIPTION: Places a cyan dot at position (390, 95).
; PLAN: r0=390(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
