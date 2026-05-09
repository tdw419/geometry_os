; DESCRIPTION: Places a blue dot at position (329, 37).
; PLAN: r0=329(x), r1=37(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 37
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
