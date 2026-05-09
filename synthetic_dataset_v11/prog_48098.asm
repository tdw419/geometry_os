; DESCRIPTION: Places a magenta dot at position (29, 166).
; PLAN: r0=29(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
