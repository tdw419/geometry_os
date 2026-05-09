; DESCRIPTION: Places a black dot at position (403, 235).
; PLAN: r0=403(x), r1=235(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 403
LDI r1, 235
LDI r2, 0x000000
PSET r0, r1, r2
HALT
