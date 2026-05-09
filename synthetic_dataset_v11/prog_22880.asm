; DESCRIPTION: Places a black dot at position (81, 252).
; PLAN: r0=81(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
HALT
