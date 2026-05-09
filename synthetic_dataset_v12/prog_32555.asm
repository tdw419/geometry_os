; DESCRIPTION: Sets a single purple pixel at (300, 161).
; PLAN: r0=300(x), r1=161(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 300
LDI r1, 161
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
