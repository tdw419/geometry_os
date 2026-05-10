; DESCRIPTION: Creates a red rectangular region at (14, 184) spanning 38 by 22 pixels.
; PLAN: r0=14(x), r1=184(y), r2=38(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 184
LDI r2, 38
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
