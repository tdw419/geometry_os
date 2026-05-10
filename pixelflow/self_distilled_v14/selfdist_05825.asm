; DESCRIPTION: Places a magenta dot at position (368, 96).
; PLAN: r0=368(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 368
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
