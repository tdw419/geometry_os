; DESCRIPTION: Places a purple dot at position (290, 226).
; PLAN: r0=290(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 290
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
