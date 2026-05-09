; DESCRIPTION: Places a black dot at position (202, 17).
; PLAN: r0=202(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
HALT
