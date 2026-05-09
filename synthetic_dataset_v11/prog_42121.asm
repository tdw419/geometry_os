; DESCRIPTION: Creates a red rectangular region at (54, 83) spanning 96 by 58 pixels.
; PLAN: r0=54(x), r1=83(y), r2=96(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 83
LDI r2, 96
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
