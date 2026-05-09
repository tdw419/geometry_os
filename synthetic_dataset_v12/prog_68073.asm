; DESCRIPTION: Renders a red disk with center (314, 135) and radius 32.
; PLAN: r0=314(x), r1=135(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 135
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
