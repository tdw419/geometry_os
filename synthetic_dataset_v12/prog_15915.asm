; DESCRIPTION: Places a red dot at position (55, 188).
; PLAN: r0=55(x), r1=188(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 188
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
