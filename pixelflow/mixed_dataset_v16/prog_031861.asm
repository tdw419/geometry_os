; DESCRIPTION: Places a red dot at position (190, 74).
; PLAN: r0=190(x), r1=74(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 190
LDI r1, 74
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
