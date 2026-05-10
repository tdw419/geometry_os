; DESCRIPTION: Places a blue dot at position (283, 125).
; PLAN: r0=283(x), r1=125(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 125
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
