; DESCRIPTION: Places a purple dot at position (391, 63).
; PLAN: r0=391(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
