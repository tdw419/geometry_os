; DESCRIPTION: Places a green dot at position (54, 18).
; PLAN: r0=54(x), r1=18(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 18
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
