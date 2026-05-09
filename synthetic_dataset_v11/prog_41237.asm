; DESCRIPTION: Places a purple dot at position (180, 160).
; PLAN: r0=180(x), r1=160(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 160
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
