; DESCRIPTION: Places a magenta dot at position (445, 94).
; PLAN: r0=445(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
