; DESCRIPTION: Places a yellow dot at position (196, 5).
; PLAN: r0=196(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
