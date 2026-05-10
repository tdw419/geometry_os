; DESCRIPTION: Places a cyan dot at position (448, 179).
; PLAN: r0=448(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
