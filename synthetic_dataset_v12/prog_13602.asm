; DESCRIPTION: Creates a red rectangular region at (416, 95) spanning 58 by 38 pixels.
; PLAN: r0=416(x), r1=95(y), r2=58(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 95
LDI r2, 58
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
