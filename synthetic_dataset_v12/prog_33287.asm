; DESCRIPTION: Sets a single purple pixel at (243, 206).
; PLAN: r0=243(x), r1=206(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 206
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
