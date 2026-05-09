; DESCRIPTION: Places a red dot at position (32, 15).
; PLAN: r0=32(x), r1=15(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 15
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
