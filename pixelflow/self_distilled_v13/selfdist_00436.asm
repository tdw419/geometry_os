; DESCRIPTION: Renders a red circular shape at (54, 162) with radius 70.
; PLAN: r0=54(x), r1=162(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 162
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
