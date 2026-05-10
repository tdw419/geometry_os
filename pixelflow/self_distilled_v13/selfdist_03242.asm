; DESCRIPTION: Places a magenta dot at position (229, 15).
; PLAN: r0=229(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 15
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
