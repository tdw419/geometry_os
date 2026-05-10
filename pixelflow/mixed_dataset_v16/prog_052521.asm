; DESCRIPTION: Places a green dot at position (169, 246).
; PLAN: r0=169(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
