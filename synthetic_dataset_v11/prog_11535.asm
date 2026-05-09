; DESCRIPTION: Places a white dot at position (182, 59).
; PLAN: r0=182(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
