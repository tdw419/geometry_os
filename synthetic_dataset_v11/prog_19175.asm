; DESCRIPTION: Places a green dot at position (186, 232).
; PLAN: r0=186(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
