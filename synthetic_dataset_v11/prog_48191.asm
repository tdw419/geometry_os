; DESCRIPTION: Places a white dot at position (150, 70).
; PLAN: r0=150(x), r1=70(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 70
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
