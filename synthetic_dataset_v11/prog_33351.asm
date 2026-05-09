; DESCRIPTION: Places a cyan dot at position (13, 45).
; PLAN: r0=13(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
