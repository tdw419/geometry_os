; DESCRIPTION: Places a black dot at position (270, 152).
; PLAN: r0=270(x), r1=152(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 152
LDI r2, 0x000000
PSET r0, r1, r2
HALT
