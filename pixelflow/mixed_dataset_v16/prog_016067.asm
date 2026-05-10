; DESCRIPTION: Places a purple dot at position (43, 215).
; PLAN: r0=43(x), r1=215(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 215
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
