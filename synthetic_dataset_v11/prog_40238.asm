; DESCRIPTION: Creates a red rectangular region at (45, 121) spanning 26 by 88 pixels.
; PLAN: r0=45(x), r1=121(y), r2=26(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 121
LDI r2, 26
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
