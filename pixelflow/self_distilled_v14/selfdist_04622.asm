; DESCRIPTION: Renders a yellow circular shape at (152, 116) with radius 70.
; PLAN: r0=152(x), r1=116(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 116
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
