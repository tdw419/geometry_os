; DESCRIPTION: Places a cyan dot at position (120, 6).
; PLAN: r0=120(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
