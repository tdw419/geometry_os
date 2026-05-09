; DESCRIPTION: Sets a single purple pixel at (392, 249).
; PLAN: r0=392(x), r1=249(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 392
LDI r1, 249
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
