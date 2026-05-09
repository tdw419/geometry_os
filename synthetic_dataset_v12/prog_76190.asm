; DESCRIPTION: Places a magenta dot at position (496, 113).
; PLAN: r0=496(x), r1=113(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 496
LDI r1, 113
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
