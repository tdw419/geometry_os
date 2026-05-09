; DESCRIPTION: Places a cyan dot at position (95, 183).
; PLAN: r0=95(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
