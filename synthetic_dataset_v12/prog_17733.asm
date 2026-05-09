; DESCRIPTION: Places a green dot at position (384, 102).
; PLAN: r0=384(x), r1=102(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 102
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
