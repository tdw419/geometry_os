; DESCRIPTION: Sets a single cyan pixel at (179, 221).
; PLAN: r0=179(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
