; DESCRIPTION: Places a red dot at position (500, 234).
; PLAN: r0=500(x), r1=234(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 500
LDI r1, 234
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
