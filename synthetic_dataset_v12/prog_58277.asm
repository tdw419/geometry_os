; DESCRIPTION: Places a green dot at position (420, 6).
; PLAN: r0=420(x), r1=6(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 6
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
