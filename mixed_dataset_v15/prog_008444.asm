; DESCRIPTION: Sets a single purple pixel at (360, 173).
; PLAN: r0=360(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 360
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
