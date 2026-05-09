; DESCRIPTION: Places a purple dot at position (488, 192).
; PLAN: r0=488(x), r1=192(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 488
LDI r1, 192
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
