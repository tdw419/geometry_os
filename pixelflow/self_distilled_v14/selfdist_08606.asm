; DESCRIPTION: Places a red disk with center (378, 73) and radius 63.
; PLAN: r0=378(x), r1=73(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 73
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
