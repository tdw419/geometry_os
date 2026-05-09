; DESCRIPTION: Places a green dot at position (2, 91).
; PLAN: r0=2(x), r1=91(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 91
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
