; DESCRIPTION: Sets a single green pixel at (184, 198).
; PLAN: r0=184(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
