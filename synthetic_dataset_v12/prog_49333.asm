; DESCRIPTION: Places a white dot at position (29, 196).
; PLAN: r0=29(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
