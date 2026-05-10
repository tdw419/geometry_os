; DESCRIPTION: Renders a green circular shape at (20, 116) with radius 68.
; PLAN: r0=20(x), r1=116(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 116
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
