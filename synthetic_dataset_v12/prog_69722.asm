; DESCRIPTION: Places a red dot at position (329, 189).
; PLAN: r0=329(x), r1=189(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 189
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
