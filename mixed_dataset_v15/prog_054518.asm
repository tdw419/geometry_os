; DESCRIPTION: Places a magenta dot at position (164, 91).
; PLAN: r0=164(x), r1=91(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 91
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
