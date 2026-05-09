; DESCRIPTION: Creates a red rectangular region at (135, 72) spanning 88 by 106 pixels.
; PLAN: r0=135(x), r1=72(y), r2=88(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 72
LDI r2, 88
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
