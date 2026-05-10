; DESCRIPTION: Sets a single cyan pixel at (414, 171).
; PLAN: r0=414(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
