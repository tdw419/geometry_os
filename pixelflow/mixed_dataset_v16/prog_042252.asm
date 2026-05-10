; DESCRIPTION: Renders a red circular shape at (39, 9) with radius 40.
; PLAN: r0=39(x), r1=9(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 9
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
