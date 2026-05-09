; DESCRIPTION: Places a red dot at position (169, 87).
; PLAN: r0=169(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 87
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
