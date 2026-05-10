; DESCRIPTION: Renders a red circular shape at (342, 112) with radius 35.
; PLAN: r0=342(x), r1=112(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 112
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
