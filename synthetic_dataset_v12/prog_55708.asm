; DESCRIPTION: Places a magenta dot at position (83, 125).
; PLAN: r0=83(x), r1=125(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 125
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
