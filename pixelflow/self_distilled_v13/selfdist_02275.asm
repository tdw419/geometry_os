; DESCRIPTION: Places a cyan dot at position (131, 83).
; PLAN: r0=131(x), r1=83(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 83
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
