; DESCRIPTION: Places a yellow dot at position (407, 182).
; PLAN: r0=407(x), r1=182(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 182
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
