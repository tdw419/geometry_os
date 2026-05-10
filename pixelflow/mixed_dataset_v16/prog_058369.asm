; DESCRIPTION: Places a magenta dot at position (151, 241).
; PLAN: r0=151(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
