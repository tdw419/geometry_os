; DESCRIPTION: Creates a red circular shape at (303, 160) with radius 38.
; PLAN: r0=303(x), r1=160(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 160
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
