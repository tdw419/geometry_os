; DESCRIPTION: Places a green dot at position (457, 5).
; PLAN: r0=457(x), r1=5(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 457
LDI r1, 5
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
