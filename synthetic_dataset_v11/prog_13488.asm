; DESCRIPTION: Sets a single cyan pixel at (55, 214).
; PLAN: r0=55(x), r1=214(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 214
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
