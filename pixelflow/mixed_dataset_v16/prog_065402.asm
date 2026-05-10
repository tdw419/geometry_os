; DESCRIPTION: Sets a single purple pixel at (336, 154).
; PLAN: r0=336(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
