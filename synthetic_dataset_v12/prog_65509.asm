; DESCRIPTION: Places a green dot at position (245, 46).
; PLAN: r0=245(x), r1=46(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 46
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
