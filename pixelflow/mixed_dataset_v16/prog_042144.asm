; DESCRIPTION: Places a magenta dot at position (444, 112).
; PLAN: r0=444(x), r1=112(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 444
LDI r1, 112
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
