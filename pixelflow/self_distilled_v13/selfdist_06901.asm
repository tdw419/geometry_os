; DESCRIPTION: Renders a red circular shape at (237, 115) with radius 54.
; PLAN: r0=237(x), r1=115(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 115
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
