; DESCRIPTION: Places a cyan dot at position (246, 0).
; PLAN: r0=246(x), r1=0(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 0
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
