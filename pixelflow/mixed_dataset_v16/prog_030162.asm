; DESCRIPTION: Sets a single purple pixel at (410, 186).
; PLAN: r0=410(x), r1=186(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 410
LDI r1, 186
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
