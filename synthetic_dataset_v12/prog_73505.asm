; DESCRIPTION: Places a green dot at position (18, 164).
; PLAN: r0=18(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
