; DESCRIPTION: Sets a single green pixel at (154, 127).
; PLAN: r0=154(x), r1=127(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 127
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
