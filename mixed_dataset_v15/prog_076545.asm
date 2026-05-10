; DESCRIPTION: Renders a red circular shape at (54, 20) with radius 30.
; PLAN: r0=54(x), r1=20(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 20
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
