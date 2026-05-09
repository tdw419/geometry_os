; DESCRIPTION: Places a red dot at position (11, 231).
; PLAN: r0=11(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
