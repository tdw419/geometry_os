; DESCRIPTION: Renders a white circular shape at (353, 116) with radius 25.
; PLAN: r0=353(x), r1=116(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 116
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
