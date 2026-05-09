; DESCRIPTION: Places a white dot at position (54, 80).
; PLAN: r0=54(x), r1=80(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 80
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
