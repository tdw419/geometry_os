; DESCRIPTION: Places a purple dot at position (440, 7).
; PLAN: r0=440(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
