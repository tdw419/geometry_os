; DESCRIPTION: Places a yellow dot at position (67, 188).
; PLAN: r0=67(x), r1=188(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 188
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
