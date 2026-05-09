; DESCRIPTION: Places a magenta dot at position (271, 67).
; PLAN: r0=271(x), r1=67(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 271
LDI r1, 67
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
