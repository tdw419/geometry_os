; DESCRIPTION: Places a red disk with center (195, 6) and radius 65.
; PLAN: r0=195(x), r1=6(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 6
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
