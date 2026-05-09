; DESCRIPTION: Places a red dot at position (89, 38).
; PLAN: r0=89(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
