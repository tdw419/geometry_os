; DESCRIPTION: Places a white dot at position (254, 144).
; PLAN: r0=254(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
