; DESCRIPTION: Places a purple dot at position (95, 89).
; PLAN: r0=95(x), r1=89(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 89
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
