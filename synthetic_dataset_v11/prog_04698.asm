; DESCRIPTION: Places a white dot at position (99, 192).
; PLAN: r0=99(x), r1=192(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 192
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
