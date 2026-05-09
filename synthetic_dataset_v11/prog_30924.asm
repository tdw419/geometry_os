; DESCRIPTION: Places a purple dot at position (214, 182).
; PLAN: r0=214(x), r1=182(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 182
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
