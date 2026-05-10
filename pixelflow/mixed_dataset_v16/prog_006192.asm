; DESCRIPTION: Places a blue dot at position (173, 206).
; PLAN: r0=173(x), r1=206(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 206
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
