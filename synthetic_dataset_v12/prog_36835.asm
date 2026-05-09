; DESCRIPTION: Places a green circle of radius 66 at center (203, 95).
; PLAN: r0=203(x), r1=95(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 95
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
