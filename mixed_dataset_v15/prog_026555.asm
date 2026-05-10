; DESCRIPTION: Places a blue dot at position (393, 189).
; PLAN: r0=393(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
