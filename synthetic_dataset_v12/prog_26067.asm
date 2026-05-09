; DESCRIPTION: Places a red dot at position (237, 155).
; PLAN: r0=237(x), r1=155(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 237
LDI r1, 155
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
