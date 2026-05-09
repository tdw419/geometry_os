; DESCRIPTION: Creates a red rectangular region at (116, 121) spanning 119 by 21 pixels.
; PLAN: r0=116(x), r1=121(y), r2=119(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 121
LDI r2, 119
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
