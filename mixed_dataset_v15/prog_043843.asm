; DESCRIPTION: Places a green dot at position (95, 69).
; PLAN: r0=95(x), r1=69(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 69
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
