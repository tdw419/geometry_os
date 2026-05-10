; DESCRIPTION: Renders a red circular shape at (108, 184) with radius 45.
; PLAN: r0=108(x), r1=184(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 184
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
