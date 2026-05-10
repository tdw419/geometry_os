; DESCRIPTION: Places a white dot at position (489, 69).
; PLAN: r0=489(x), r1=69(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 489
LDI r1, 69
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
