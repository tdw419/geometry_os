; DESCRIPTION: Places a white dot at position (59, 196).
; PLAN: r0=59(x), r1=196(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 196
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
