; DESCRIPTION: Places a blue dot at position (352, 115).
; PLAN: r0=352(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
