; DESCRIPTION: Sets a single cyan pixel at (489, 237).
; PLAN: r0=489(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 489
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
