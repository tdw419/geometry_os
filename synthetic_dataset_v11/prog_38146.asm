; DESCRIPTION: Places a orange dot at position (196, 88).
; PLAN: r0=196(x), r1=88(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 88
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
