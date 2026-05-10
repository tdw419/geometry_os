; DESCRIPTION: Places a purple dot at position (66, 111).
; PLAN: r0=66(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
