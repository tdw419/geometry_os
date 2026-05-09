; DESCRIPTION: Places a purple dot at position (220, 150).
; PLAN: r0=220(x), r1=150(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 150
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
