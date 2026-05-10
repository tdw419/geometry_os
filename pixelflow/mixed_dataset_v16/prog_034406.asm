; DESCRIPTION: Sets a single cyan pixel at (273, 208).
; PLAN: r0=273(x), r1=208(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 208
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
