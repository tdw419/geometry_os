; DESCRIPTION: Creates a red circular shape at (315, 70) with radius 70.
; PLAN: r0=315(x), r1=70(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 70
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
