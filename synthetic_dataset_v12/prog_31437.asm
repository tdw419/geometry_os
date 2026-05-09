; DESCRIPTION: Places a green dot at position (164, 250).
; PLAN: r0=164(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
