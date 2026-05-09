; DESCRIPTION: Places a green dot at position (1, 101).
; PLAN: r0=1(x), r1=101(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 101
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
