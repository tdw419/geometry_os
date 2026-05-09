; DESCRIPTION: Places a black dot at position (192, 91).
; PLAN: r0=192(x), r1=91(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 91
LDI r2, 0x000000
PSET r0, r1, r2
HALT
