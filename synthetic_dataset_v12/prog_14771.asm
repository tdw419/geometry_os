; DESCRIPTION: Places a purple dot at position (330, 209).
; PLAN: r0=330(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 330
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
