; DESCRIPTION: Places a blue dot at position (346, 219).
; PLAN: r0=346(x), r1=219(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 219
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
