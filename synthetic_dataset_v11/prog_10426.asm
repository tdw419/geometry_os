; DESCRIPTION: Sets a single cyan pixel at (229, 186).
; PLAN: r0=229(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 186
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
