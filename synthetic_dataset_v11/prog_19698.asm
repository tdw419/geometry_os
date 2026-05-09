; DESCRIPTION: Places a cyan dot at position (184, 45).
; PLAN: r0=184(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
