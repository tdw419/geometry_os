; DESCRIPTION: Places a purple dot at position (176, 252).
; PLAN: r0=176(x), r1=252(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 252
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
