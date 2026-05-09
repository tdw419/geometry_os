; DESCRIPTION: Places a green dot at position (217, 156).
; PLAN: r0=217(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 156
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
