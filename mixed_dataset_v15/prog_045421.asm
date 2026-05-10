; DESCRIPTION: Places a yellow dot at position (104, 107).
; PLAN: r0=104(x), r1=107(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 107
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
