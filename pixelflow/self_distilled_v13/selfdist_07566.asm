; DESCRIPTION: Places a green dot at position (366, 103).
; PLAN: r0=366(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
