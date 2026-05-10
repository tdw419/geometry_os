; DESCRIPTION: Places a green dot at position (232, 199).
; PLAN: r0=232(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
