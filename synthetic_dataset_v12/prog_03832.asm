; DESCRIPTION: Renders a red disk with center (244, 203) and radius 21.
; PLAN: r0=244(x), r1=203(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 203
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
