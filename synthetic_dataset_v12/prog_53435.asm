; DESCRIPTION: Places a orange dot at position (128, 54).
; PLAN: r0=128(x), r1=54(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 54
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
