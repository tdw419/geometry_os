; DESCRIPTION: Sets a single cyan pixel at (418, 228).
; PLAN: r0=418(x), r1=228(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 228
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
