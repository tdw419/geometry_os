; DESCRIPTION: Places a white dot at position (58, 207).
; PLAN: r0=58(x), r1=207(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 207
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
