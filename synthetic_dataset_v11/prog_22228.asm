; DESCRIPTION: Sets a single purple pixel at (197, 166).
; PLAN: r0=197(x), r1=166(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 166
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
