; DESCRIPTION: Places a green dot at position (71, 152).
; PLAN: r0=71(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
