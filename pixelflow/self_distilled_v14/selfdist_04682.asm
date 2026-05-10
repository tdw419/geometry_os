; DESCRIPTION: Places a white dot at position (274, 178).
; PLAN: r0=274(x), r1=178(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 178
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
