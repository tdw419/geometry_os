; DESCRIPTION: Creates a red rectangular region at (74, 70) spanning 88 by 112 pixels.
; PLAN: r0=74(x), r1=70(y), r2=88(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 70
LDI r2, 88
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
