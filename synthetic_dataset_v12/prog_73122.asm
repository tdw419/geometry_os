; DESCRIPTION: Places a purple dot at position (61, 213).
; PLAN: r0=61(x), r1=213(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 213
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
