; DESCRIPTION: Places a blue dot at position (154, 104).
; PLAN: r0=154(x), r1=104(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 104
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
