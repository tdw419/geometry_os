; DESCRIPTION: Places a purple dot at position (294, 88).
; PLAN: r0=294(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 294
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
