; DESCRIPTION: Sets a single cyan pixel at (491, 16).
; PLAN: r0=491(x), r1=16(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 16
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
