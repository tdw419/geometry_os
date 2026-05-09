; DESCRIPTION: Sets a single cyan pixel at (401, 60).
; PLAN: r0=401(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 401
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
