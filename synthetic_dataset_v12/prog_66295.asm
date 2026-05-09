; DESCRIPTION: Places a orange dot at position (398, 4).
; PLAN: r0=398(x), r1=4(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 4
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
