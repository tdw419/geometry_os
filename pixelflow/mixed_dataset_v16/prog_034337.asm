; DESCRIPTION: Renders a red circular shape at (161, 3) with radius 46.
; PLAN: r0=161(x), r1=3(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 3
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
