; DESCRIPTION: Sets a single red pixel at (92, 177).
; PLAN: r0=92(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 177
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
