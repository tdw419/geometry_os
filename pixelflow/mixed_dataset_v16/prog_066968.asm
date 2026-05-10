; DESCRIPTION: Places a green dot at position (252, 45).
; PLAN: r0=252(x), r1=45(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 45
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
