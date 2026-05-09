; DESCRIPTION: Places a blue dot at position (60, 180).
; PLAN: r0=60(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
