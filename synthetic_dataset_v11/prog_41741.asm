; DESCRIPTION: Places a green dot at position (51, 211).
; PLAN: r0=51(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
