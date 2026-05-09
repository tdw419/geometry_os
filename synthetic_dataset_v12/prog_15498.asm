; DESCRIPTION: Places a red dot at position (291, 89).
; PLAN: r0=291(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 291
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
