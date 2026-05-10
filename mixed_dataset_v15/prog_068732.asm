; DESCRIPTION: Sets a single red pixel at (412, 83).
; PLAN: r0=412(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
