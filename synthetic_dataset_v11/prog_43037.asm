; DESCRIPTION: Places a cyan dot at position (63, 119).
; PLAN: r0=63(x), r1=119(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 119
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
