; DESCRIPTION: Places a green dot at position (109, 71).
; PLAN: r0=109(x), r1=71(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 71
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
