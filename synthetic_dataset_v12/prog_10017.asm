; DESCRIPTION: Places a cyan dot at position (511, 82).
; PLAN: r0=511(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
