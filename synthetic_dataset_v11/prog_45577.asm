; DESCRIPTION: Places a magenta dot at position (91, 218).
; PLAN: r0=91(x), r1=218(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 218
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
