; DESCRIPTION: Creates a white rectangular region at (81, 124) spanning 88 by 19 pixels.
; PLAN: r0=81(x), r1=124(y), r2=88(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 124
LDI r2, 88
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
