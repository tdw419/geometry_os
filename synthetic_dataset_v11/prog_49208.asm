; DESCRIPTION: Places a purple dot at position (157, 50).
; PLAN: r0=157(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 157
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
