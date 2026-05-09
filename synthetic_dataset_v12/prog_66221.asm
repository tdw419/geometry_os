; DESCRIPTION: Places a red dot at position (308, 108).
; PLAN: r0=308(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
