; DESCRIPTION: Places a white dot at position (182, 88).
; PLAN: r0=182(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
