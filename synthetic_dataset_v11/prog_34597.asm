; DESCRIPTION: Places a green dot at position (45, 1).
; PLAN: r0=45(x), r1=1(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
