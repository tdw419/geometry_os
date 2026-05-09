; DESCRIPTION: Renders a red disk with center (339, 135) and radius 64.
; PLAN: r0=339(x), r1=135(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 135
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
