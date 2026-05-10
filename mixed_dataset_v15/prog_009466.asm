; DESCRIPTION: Creates a red circular shape at (152, 174) with radius 52.
; PLAN: r0=152(x), r1=174(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 174
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
