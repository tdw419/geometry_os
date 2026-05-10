; DESCRIPTION: Renders a red circular shape at (291, 126) with radius 47.
; PLAN: r0=291(x), r1=126(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 126
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
