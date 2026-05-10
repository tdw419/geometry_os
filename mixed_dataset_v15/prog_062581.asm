; DESCRIPTION: Places a white dot at position (59, 186).
; PLAN: r0=59(x), r1=186(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 186
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
