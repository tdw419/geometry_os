; DESCRIPTION: Places a blue dot at position (92, 235).
; PLAN: r0=92(x), r1=235(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 235
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
