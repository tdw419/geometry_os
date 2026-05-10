; DESCRIPTION: Sets a single cyan pixel at (45, 150).
; PLAN: r0=45(x), r1=150(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 150
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
