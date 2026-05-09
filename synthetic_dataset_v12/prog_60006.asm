; DESCRIPTION: Places a red dot at position (21, 218).
; PLAN: r0=21(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
