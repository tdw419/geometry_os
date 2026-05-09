; DESCRIPTION: Places a orange dot at position (67, 190).
; PLAN: r0=67(x), r1=190(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 190
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
