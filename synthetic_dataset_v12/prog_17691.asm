; DESCRIPTION: Places a white dot at position (28, 152).
; PLAN: r0=28(x), r1=152(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 152
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
