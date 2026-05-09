; DESCRIPTION: Places a green dot at position (187, 26).
; PLAN: r0=187(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 26
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
