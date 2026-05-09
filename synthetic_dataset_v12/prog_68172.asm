; DESCRIPTION: Places a orange dot at position (278, 187).
; PLAN: r0=278(x), r1=187(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 278
LDI r1, 187
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
