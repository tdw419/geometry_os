; DESCRIPTION: Places a cyan dot at position (237, 105).
; PLAN: r0=237(x), r1=105(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 105
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
