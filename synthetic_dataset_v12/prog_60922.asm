; DESCRIPTION: Places a blue dot at position (296, 8).
; PLAN: r0=296(x), r1=8(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 296
LDI r1, 8
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
