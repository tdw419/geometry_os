; DESCRIPTION: Creates a red rectangular region at (72, 49) spanning 116 by 119 pixels.
; PLAN: r0=72(x), r1=49(y), r2=116(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 49
LDI r2, 116
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
