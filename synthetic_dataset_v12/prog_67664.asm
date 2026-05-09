; DESCRIPTION: Places a magenta dot at position (370, 93).
; PLAN: r0=370(x), r1=93(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 93
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
