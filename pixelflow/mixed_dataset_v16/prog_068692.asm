; DESCRIPTION: Renders a red circular shape at (332, 59) with radius 74.
; PLAN: r0=332(x), r1=59(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 59
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
