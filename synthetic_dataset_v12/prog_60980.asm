; DESCRIPTION: Places a purple dot at position (446, 232).
; PLAN: r0=446(x), r1=232(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 232
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
