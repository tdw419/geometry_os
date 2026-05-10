; DESCRIPTION: Places a cyan dot at position (232, 133).
; PLAN: r0=232(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
