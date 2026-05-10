; DESCRIPTION: Renders a red circular shape at (72, 112) with radius 37.
; PLAN: r0=72(x), r1=112(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 112
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
