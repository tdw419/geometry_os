; DESCRIPTION: Sets a single magenta pixel at (438, 76).
; PLAN: r0=438(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
