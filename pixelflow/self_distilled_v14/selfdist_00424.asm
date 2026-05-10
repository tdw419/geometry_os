; DESCRIPTION: Places a cyan dot at position (370, 105).
; PLAN: r0=370(x), r1=105(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 105
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
