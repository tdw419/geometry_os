; DESCRIPTION: Places a cyan dot at position (76, 120).
; PLAN: r0=76(x), r1=120(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 120
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
