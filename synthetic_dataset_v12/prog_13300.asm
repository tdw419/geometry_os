; DESCRIPTION: Places a white dot at position (507, 113).
; PLAN: r0=507(x), r1=113(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 113
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
