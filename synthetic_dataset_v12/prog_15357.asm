; DESCRIPTION: Places a black dot at position (305, 149).
; PLAN: r0=305(x), r1=149(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 149
LDI r2, 0x000000
PSET r0, r1, r2
HALT
