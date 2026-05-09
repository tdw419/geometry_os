; DESCRIPTION: Places a purple dot at position (146, 211).
; PLAN: r0=146(x), r1=211(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 211
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
