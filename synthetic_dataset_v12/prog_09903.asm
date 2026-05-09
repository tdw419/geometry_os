; DESCRIPTION: Places a white dot at position (332, 163).
; PLAN: r0=332(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
