; DESCRIPTION: Places a green dot at position (106, 51).
; PLAN: r0=106(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
