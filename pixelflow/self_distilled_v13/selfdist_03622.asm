; DESCRIPTION: Places a red dot at position (244, 177).
; PLAN: r0=244(x), r1=177(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 177
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
