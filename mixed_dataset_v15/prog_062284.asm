; DESCRIPTION: Sets a single black pixel at (313, 59).
; PLAN: r0=313(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 313
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
HALT
