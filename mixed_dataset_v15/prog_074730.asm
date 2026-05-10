; DESCRIPTION: Places a red dot at position (253, 31).
; PLAN: r0=253(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 31
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
