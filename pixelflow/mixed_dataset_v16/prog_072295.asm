; DESCRIPTION: Places a orange dot at position (16, 21).
; PLAN: r0=16(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 21
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
