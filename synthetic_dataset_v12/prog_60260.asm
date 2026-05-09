; DESCRIPTION: Places a magenta dot at position (391, 150).
; PLAN: r0=391(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
