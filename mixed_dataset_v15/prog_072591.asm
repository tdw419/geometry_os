; DESCRIPTION: Places a magenta dot at position (119, 214).
; PLAN: r0=119(x), r1=214(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 214
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
