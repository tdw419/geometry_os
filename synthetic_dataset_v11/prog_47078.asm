; DESCRIPTION: Places a purple dot at position (246, 240).
; PLAN: r0=246(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 240
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
