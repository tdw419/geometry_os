; DESCRIPTION: Renders a red disk with center (474, 76) and radius 25.
; PLAN: r0=474(x), r1=76(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 76
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
