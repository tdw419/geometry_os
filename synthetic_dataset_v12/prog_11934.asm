; DESCRIPTION: Creates a red circular shape at (350, 55) with radius 43.
; PLAN: r0=350(x), r1=55(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 55
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
