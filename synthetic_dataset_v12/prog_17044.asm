; DESCRIPTION: Places a green dot at position (112, 4).
; PLAN: r0=112(x), r1=4(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 4
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
