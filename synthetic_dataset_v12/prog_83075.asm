; DESCRIPTION: Places a blue dot at position (236, 190).
; PLAN: r0=236(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
