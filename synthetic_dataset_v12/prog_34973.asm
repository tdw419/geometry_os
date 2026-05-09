; DESCRIPTION: Places a purple dot at position (198, 223).
; PLAN: r0=198(x), r1=223(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 223
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
