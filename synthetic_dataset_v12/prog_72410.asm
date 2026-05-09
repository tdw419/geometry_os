; DESCRIPTION: Places a white dot at position (286, 222).
; PLAN: r0=286(x), r1=222(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 222
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
