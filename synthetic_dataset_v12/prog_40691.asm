; DESCRIPTION: Sets a single purple pixel at (446, 55).
; PLAN: r0=446(x), r1=55(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 55
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
