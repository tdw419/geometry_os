; DESCRIPTION: Places a cyan dot at position (265, 53).
; PLAN: r0=265(x), r1=53(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 53
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
