; DESCRIPTION: Places a green dot at position (153, 132).
; PLAN: r0=153(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
