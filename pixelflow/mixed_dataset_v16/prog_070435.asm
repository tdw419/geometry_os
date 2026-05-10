; DESCRIPTION: Sets a single purple pixel at (305, 142).
; PLAN: r0=305(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
