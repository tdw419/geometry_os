; DESCRIPTION: Places a blue dot at position (135, 14).
; PLAN: r0=135(x), r1=14(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 14
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
