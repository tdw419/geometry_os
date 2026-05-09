; DESCRIPTION: Places a cyan dot at position (109, 38).
; PLAN: r0=109(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
