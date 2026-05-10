; DESCRIPTION: Creates a red circular shape at (336, 146) with radius 70.
; PLAN: r0=336(x), r1=146(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 146
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
