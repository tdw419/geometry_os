; DESCRIPTION: Places a purple dot at position (171, 176).
; PLAN: r0=171(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 176
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
