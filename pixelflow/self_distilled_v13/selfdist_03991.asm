; DESCRIPTION: Sets a single purple pixel at (313, 92).
; PLAN: r0=313(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 313
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
