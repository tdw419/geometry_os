; DESCRIPTION: Creates a white rectangular region at (185, 88) spanning 53 by 74 pixels.
; PLAN: r0=185(x), r1=88(y), r2=53(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 88
LDI r2, 53
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
