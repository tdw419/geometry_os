; DESCRIPTION: Sets a single blue pixel at (174, 197).
; PLAN: r0=174(x), r1=197(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 197
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
