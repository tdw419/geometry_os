; DESCRIPTION: Places a red dot at position (345, 247).
; PLAN: r0=345(x), r1=247(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 247
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
