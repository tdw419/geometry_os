; DESCRIPTION: Renders a red circular shape at (170, 1) with radius 16.
; PLAN: r0=170(x), r1=1(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 1
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
