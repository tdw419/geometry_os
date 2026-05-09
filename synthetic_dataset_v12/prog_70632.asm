; DESCRIPTION: Sets a single red pixel at (242, 19).
; PLAN: r0=242(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
