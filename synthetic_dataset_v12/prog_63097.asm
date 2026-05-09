; DESCRIPTION: Places a purple dot at position (368, 229).
; PLAN: r0=368(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
