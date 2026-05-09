; DESCRIPTION: Places a purple dot at position (398, 87).
; PLAN: r0=398(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
