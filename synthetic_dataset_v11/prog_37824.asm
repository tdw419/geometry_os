; DESCRIPTION: Places a white dot at position (186, 165).
; PLAN: r0=186(x), r1=165(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 165
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
