; DESCRIPTION: Places a blue dot at position (267, 106).
; PLAN: r0=267(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 267
LDI r1, 106
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
