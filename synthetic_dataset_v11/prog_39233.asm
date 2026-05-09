; DESCRIPTION: Places a magenta dot at position (95, 237).
; PLAN: r0=95(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
