; DESCRIPTION: Places a yellow dot at position (217, 74).
; PLAN: r0=217(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
