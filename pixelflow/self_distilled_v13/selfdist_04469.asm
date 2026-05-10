; DESCRIPTION: Renders a white circular shape at (158, 193) with radius 38.
; PLAN: r0=158(x), r1=193(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 193
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
