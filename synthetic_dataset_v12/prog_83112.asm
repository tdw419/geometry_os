; DESCRIPTION: Places a green dot at position (105, 197).
; PLAN: r0=105(x), r1=197(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 197
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
