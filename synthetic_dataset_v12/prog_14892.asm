; DESCRIPTION: Places a purple dot at position (326, 111).
; PLAN: r0=326(x), r1=111(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 326
LDI r1, 111
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
