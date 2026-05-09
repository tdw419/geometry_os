; DESCRIPTION: Places a cyan dot at position (90, 137).
; PLAN: r0=90(x), r1=137(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 137
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
