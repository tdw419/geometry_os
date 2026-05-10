; DESCRIPTION: Places a purple dot at position (344, 204).
; PLAN: r0=344(x), r1=204(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 204
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
