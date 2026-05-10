; DESCRIPTION: Places a red dot at position (338, 38).
; PLAN: r0=338(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
