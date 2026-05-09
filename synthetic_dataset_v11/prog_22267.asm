; DESCRIPTION: Places a green dot at position (192, 46).
; PLAN: r0=192(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
