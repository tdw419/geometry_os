; DESCRIPTION: Places a white dot at position (492, 185).
; PLAN: r0=492(x), r1=185(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 492
LDI r1, 185
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
