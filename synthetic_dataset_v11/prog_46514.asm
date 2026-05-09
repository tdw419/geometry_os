; DESCRIPTION: Sets a single cyan pixel at (171, 224).
; PLAN: r0=171(x), r1=224(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 171
LDI r1, 224
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
