; DESCRIPTION: Places a blue dot at position (50, 116).
; PLAN: r0=50(x), r1=116(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 116
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
