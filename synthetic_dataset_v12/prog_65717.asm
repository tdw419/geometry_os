; DESCRIPTION: Creates a red rectangular region at (263, 22) spanning 38 by 62 pixels.
; PLAN: r0=263(x), r1=22(y), r2=38(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 22
LDI r2, 38
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
