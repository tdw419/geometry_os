; DESCRIPTION: Places a magenta dot at position (210, 132).
; PLAN: r0=210(x), r1=132(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 210
LDI r1, 132
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
