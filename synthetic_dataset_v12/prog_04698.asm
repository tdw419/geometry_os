; DESCRIPTION: Places a red dot at position (137, 212).
; PLAN: r0=137(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 212
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
