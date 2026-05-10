; DESCRIPTION: Places a cyan dot at position (490, 13).
; PLAN: r0=490(x), r1=13(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 13
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
