; DESCRIPTION: Places a black dot at position (46, 59).
; PLAN: r0=46(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
HALT
