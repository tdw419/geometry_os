; DESCRIPTION: Places a purple dot at position (485, 137).
; PLAN: r0=485(x), r1=137(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 485
LDI r1, 137
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
