; DESCRIPTION: Places a cyan dot at position (158, 30).
; PLAN: r0=158(x), r1=30(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 30
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
