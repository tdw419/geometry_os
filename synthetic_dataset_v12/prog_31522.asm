; DESCRIPTION: Places a white dot at position (222, 169).
; PLAN: r0=222(x), r1=169(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 169
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
