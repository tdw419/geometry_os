; DESCRIPTION: Places a yellow dot at position (276, 164).
; PLAN: r0=276(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
