; DESCRIPTION: Places a white dot at position (130, 240).
; PLAN: r0=130(x), r1=240(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 240
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
