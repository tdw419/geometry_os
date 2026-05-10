; DESCRIPTION: Places a red dot at position (100, 209).
; PLAN: r0=100(x), r1=209(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 209
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
