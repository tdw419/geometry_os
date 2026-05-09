; DESCRIPTION: Places a green circle of radius 15 at center (116, 172).
; PLAN: r0=116(x), r1=172(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 172
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
