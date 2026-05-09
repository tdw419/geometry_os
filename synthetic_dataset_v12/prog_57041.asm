; DESCRIPTION: Places a green dot at position (375, 182).
; PLAN: r0=375(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
