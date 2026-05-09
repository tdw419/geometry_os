; DESCRIPTION: Places a red dot at position (212, 244).
; PLAN: r0=212(x), r1=244(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 244
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
