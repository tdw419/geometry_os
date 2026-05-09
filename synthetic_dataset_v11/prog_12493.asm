; DESCRIPTION: Places a white dot at position (116, 239).
; PLAN: r0=116(x), r1=239(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 239
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
