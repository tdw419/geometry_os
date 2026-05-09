; DESCRIPTION: Sets a single cyan pixel at (198, 3).
; PLAN: r0=198(x), r1=3(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 3
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
