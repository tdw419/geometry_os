; DESCRIPTION: Places a white dot at position (148, 56).
; PLAN: r0=148(x), r1=56(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 56
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
