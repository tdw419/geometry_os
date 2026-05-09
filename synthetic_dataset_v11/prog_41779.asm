; DESCRIPTION: Places a green dot at position (47, 225).
; PLAN: r0=47(x), r1=225(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 225
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
