; DESCRIPTION: Sets a single orange pixel at (244, 198).
; PLAN: r0=244(x), r1=198(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 198
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
