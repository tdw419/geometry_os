; DESCRIPTION: Places a white dot at position (51, 208).
; PLAN: r0=51(x), r1=208(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 208
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
