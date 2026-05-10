; DESCRIPTION: Places a cyan dot at position (159, 74).
; PLAN: r0=159(x), r1=74(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 74
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
