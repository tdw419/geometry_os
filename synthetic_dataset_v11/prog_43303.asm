; DESCRIPTION: Places a orange dot at position (222, 215).
; PLAN: r0=222(x), r1=215(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 215
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
