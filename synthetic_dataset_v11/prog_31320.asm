; DESCRIPTION: Places a magenta dot at position (238, 59).
; PLAN: r0=238(x), r1=59(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 59
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
