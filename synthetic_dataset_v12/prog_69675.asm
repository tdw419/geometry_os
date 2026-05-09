; DESCRIPTION: Sets a single magenta pixel at (499, 111).
; PLAN: r0=499(x), r1=111(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 111
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
