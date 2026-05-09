; DESCRIPTION: Places a yellow dot at position (124, 209).
; PLAN: r0=124(x), r1=209(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 209
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
