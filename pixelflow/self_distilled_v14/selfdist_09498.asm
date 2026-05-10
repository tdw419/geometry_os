; DESCRIPTION: Places a yellow dot at position (235, 60).
; PLAN: r0=235(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
