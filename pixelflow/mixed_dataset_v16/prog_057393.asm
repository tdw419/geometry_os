; DESCRIPTION: Places a green dot at position (177, 67).
; PLAN: r0=177(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
