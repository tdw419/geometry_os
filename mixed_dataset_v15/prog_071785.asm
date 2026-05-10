; DESCRIPTION: Creates a red rectangular region at (138, 37) spanning 88 by 117 pixels.
; PLAN: r0=138(x), r1=37(y), r2=88(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 37
LDI r2, 88
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
