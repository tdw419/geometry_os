; DESCRIPTION: Creates a red circular shape at (349, 70) with radius 67.
; PLAN: r0=349(x), r1=70(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 70
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
