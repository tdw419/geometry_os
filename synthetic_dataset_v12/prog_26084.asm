; DESCRIPTION: Sets a single cyan pixel at (148, 55).
; PLAN: r0=148(x), r1=55(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 55
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
