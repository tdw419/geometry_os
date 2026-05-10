; DESCRIPTION: Places a blue dot at position (202, 56).
; PLAN: r0=202(x), r1=56(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 56
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
