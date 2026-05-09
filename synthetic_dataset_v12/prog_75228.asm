; DESCRIPTION: Places a purple dot at position (267, 203).
; PLAN: r0=267(x), r1=203(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 267
LDI r1, 203
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
