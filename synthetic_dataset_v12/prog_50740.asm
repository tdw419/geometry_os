; DESCRIPTION: Places a green dot at position (469, 110).
; PLAN: r0=469(x), r1=110(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 469
LDI r1, 110
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
