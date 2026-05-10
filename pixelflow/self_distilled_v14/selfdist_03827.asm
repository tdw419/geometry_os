; DESCRIPTION: Places a white dot at position (233, 59).
; PLAN: r0=233(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
