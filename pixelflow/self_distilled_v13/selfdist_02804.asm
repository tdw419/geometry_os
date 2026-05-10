; DESCRIPTION: Creates a vertical green gradient from black to green.
; PLAN: r0=1(x), r1=12(y), r2=0x00FF00(color). Op: FILL r0.
LDI r0, 1
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
