; DESCRIPTION: Places a yellow dot at position (400, 199).
; PLAN: r0=400(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
