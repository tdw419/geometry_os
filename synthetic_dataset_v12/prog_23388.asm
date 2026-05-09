; DESCRIPTION: Places a cyan dot at position (477, 190).
; PLAN: r0=477(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
