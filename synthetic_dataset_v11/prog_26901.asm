; DESCRIPTION: Renders a red disk with center (203, 172) and radius 25.
; PLAN: r0=203(x), r1=172(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 172
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
