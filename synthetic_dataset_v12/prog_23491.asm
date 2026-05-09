; DESCRIPTION: Places a blue dot at position (176, 237).
; PLAN: r0=176(x), r1=237(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 237
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
