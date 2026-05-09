; DESCRIPTION: Places a red dot at position (82, 188).
; PLAN: r0=82(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
