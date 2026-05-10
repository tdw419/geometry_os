; DESCRIPTION: Places a orange dot at position (135, 147).
; PLAN: r0=135(x), r1=147(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 147
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
