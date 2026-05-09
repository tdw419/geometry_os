; DESCRIPTION: Places a purple dot at position (228, 82).
; PLAN: r0=228(x), r1=82(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 82
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
