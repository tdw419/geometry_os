; DESCRIPTION: Places a green dot at position (17, 204).
; PLAN: r0=17(x), r1=204(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 204
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
