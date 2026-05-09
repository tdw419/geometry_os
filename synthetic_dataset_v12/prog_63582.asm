; DESCRIPTION: Places a red dot at position (439, 252).
; PLAN: r0=439(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 439
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
