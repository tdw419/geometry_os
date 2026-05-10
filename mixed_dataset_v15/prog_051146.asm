; DESCRIPTION: Places a orange dot at position (370, 196).
; PLAN: r0=370(x), r1=196(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 196
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
