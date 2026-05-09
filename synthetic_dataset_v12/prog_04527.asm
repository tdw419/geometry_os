; DESCRIPTION: Places a blue dot at position (199, 94).
; PLAN: r0=199(x), r1=94(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 94
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
