; DESCRIPTION: Creates a red circular shape at (95, 69) with radius 54.
; PLAN: r0=95(x), r1=69(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 69
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
