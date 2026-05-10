; DESCRIPTION: Places a yellow dot at position (167, 237).
; PLAN: r0=167(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
