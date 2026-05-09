; DESCRIPTION: Sets a single cyan pixel at (460, 38).
; PLAN: r0=460(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 460
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
