; DESCRIPTION: Renders a red disk with center (203, 146) and radius 35.
; PLAN: r0=203(x), r1=146(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 146
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
