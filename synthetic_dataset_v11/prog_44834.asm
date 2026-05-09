; DESCRIPTION: Places a magenta dot at position (62, 184).
; PLAN: r0=62(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
