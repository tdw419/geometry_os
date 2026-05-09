; DESCRIPTION: Places a green dot at position (85, 238).
; PLAN: r0=85(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
