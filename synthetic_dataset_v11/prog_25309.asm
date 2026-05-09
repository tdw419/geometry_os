; DESCRIPTION: Places a white dot at position (144, 7).
; PLAN: r0=144(x), r1=7(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 7
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
