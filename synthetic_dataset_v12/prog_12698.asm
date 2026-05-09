; DESCRIPTION: Places a white dot at position (350, 50).
; PLAN: r0=350(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 350
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
