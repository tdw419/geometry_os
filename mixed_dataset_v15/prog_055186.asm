; DESCRIPTION: Places a green dot at position (293, 170).
; PLAN: r0=293(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 293
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
