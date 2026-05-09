; DESCRIPTION: Places a white dot at position (412, 117).
; PLAN: r0=412(x), r1=117(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 412
LDI r1, 117
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
