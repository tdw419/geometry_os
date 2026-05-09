; DESCRIPTION: Sets a single black pixel at (229, 236).
; PLAN: r0=229(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
HALT
