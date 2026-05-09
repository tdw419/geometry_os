; DESCRIPTION: Places a red dot at position (215, 66).
; PLAN: r0=215(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 66
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
