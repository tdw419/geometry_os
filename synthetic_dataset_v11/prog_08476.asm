; DESCRIPTION: Places a white dot at position (91, 122).
; PLAN: r0=91(x), r1=122(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 122
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
