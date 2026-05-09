; DESCRIPTION: Places a purple dot at position (481, 253).
; PLAN: r0=481(x), r1=253(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 253
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
