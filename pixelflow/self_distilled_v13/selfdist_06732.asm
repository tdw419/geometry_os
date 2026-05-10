; DESCRIPTION: Places a red disk with center (203, 48) and radius 54.
; PLAN: r0=203(x), r1=48(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 48
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
