; DESCRIPTION: Sets a single magenta pixel at (25, 91).
; PLAN: r0=25(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
