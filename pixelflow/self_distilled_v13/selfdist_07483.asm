; DESCRIPTION: Renders a white circular shape at (60, 72) with radius 80.
; PLAN: r0=60(x), r1=72(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 72
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
