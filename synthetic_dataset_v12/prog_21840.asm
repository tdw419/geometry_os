; DESCRIPTION: Places a white dot at position (482, 83).
; PLAN: r0=482(x), r1=83(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 83
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
