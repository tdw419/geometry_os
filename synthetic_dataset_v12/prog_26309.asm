; DESCRIPTION: Sets a single green pixel at (255, 138).
; PLAN: r0=255(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
