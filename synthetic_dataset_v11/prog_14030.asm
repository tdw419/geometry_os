; DESCRIPTION: Places a cyan dot at position (5, 133).
; PLAN: r0=5(x), r1=133(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 133
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
