; DESCRIPTION: Places a magenta dot at position (27, 18).
; PLAN: r0=27(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
