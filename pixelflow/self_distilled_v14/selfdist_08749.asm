; DESCRIPTION: Renders a red circular shape at (84, 45) with radius 49.
; PLAN: r0=84(x), r1=45(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 45
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
