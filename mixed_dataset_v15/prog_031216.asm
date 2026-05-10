; DESCRIPTION: Places a purple dot at position (459, 152).
; PLAN: r0=459(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
