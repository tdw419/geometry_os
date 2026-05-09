; DESCRIPTION: Sets a single cyan pixel at (69, 1).
; PLAN: r0=69(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
