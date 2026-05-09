; DESCRIPTION: Sets a single orange pixel at (120, 213).
; PLAN: r0=120(x), r1=213(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 213
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
