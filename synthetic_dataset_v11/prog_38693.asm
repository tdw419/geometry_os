; DESCRIPTION: Places a purple dot at position (120, 240).
; PLAN: r0=120(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 240
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
