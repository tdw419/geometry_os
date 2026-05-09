; DESCRIPTION: Places a green dot at position (249, 153).
; PLAN: r0=249(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
