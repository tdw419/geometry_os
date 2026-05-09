; DESCRIPTION: Places a orange dot at position (188, 218).
; PLAN: r0=188(x), r1=218(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 218
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
