; DESCRIPTION: Sets a single orange pixel at (346, 184).
; PLAN: r0=346(x), r1=184(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 184
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
