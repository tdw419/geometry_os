; DESCRIPTION: Sets a single orange pixel at (374, 48).
; PLAN: r0=374(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
