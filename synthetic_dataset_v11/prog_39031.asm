; DESCRIPTION: Places a black dot at position (169, 70).
; PLAN: r0=169(x), r1=70(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 70
LDI r2, 0x000000
PSET r0, r1, r2
HALT
