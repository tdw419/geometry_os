; DESCRIPTION: Sets a single cyan pixel at (223, 229).
; PLAN: r0=223(x), r1=229(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 223
LDI r1, 229
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
