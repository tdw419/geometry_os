; DESCRIPTION: Places a red dot at position (269, 161).
; PLAN: r0=269(x), r1=161(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 161
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
