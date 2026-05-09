; DESCRIPTION: Places a green dot at position (499, 163).
; PLAN: r0=499(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 499
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
