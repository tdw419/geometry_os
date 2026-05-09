; DESCRIPTION: Sets a single purple pixel at (479, 245).
; PLAN: r0=479(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 479
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
