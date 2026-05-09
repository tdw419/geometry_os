; DESCRIPTION: Places a yellow dot at position (84, 224).
; PLAN: r0=84(x), r1=224(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 224
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
