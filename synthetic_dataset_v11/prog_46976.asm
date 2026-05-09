; DESCRIPTION: Places a black dot at position (240, 109).
; PLAN: r0=240(x), r1=109(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 109
LDI r2, 0x000000
PSET r0, r1, r2
HALT
