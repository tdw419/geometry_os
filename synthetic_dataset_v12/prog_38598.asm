; DESCRIPTION: Places a orange dot at position (74, 229).
; PLAN: r0=74(x), r1=229(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 229
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
