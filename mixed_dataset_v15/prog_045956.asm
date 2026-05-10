; DESCRIPTION: Places a magenta dot at position (446, 104).
; PLAN: r0=446(x), r1=104(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 104
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
