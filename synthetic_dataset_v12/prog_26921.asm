; DESCRIPTION: Sets a single cyan pixel at (228, 103).
; PLAN: r0=228(x), r1=103(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 103
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
