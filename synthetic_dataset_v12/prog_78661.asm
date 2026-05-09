; DESCRIPTION: Sets a single green pixel at (202, 164).
; PLAN: r0=202(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
