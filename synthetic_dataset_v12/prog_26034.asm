; DESCRIPTION: Sets a single cyan pixel at (185, 59).
; PLAN: r0=185(x), r1=59(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 59
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
