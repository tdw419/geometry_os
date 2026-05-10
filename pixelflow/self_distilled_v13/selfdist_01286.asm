; DESCRIPTION: Places a magenta dot at position (117, 14).
; PLAN: r0=117(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
