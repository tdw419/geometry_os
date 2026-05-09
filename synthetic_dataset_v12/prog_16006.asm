; DESCRIPTION: Places a blue dot at position (280, 169).
; PLAN: r0=280(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 280
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
