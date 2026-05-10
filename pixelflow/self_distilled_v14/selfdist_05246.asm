; DESCRIPTION: Places a magenta dot at position (305, 131).
; PLAN: r0=305(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
