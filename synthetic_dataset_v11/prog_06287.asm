; DESCRIPTION: Places a white dot at position (244, 91).
; PLAN: r0=244(x), r1=91(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 91
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
