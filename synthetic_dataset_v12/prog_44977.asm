; DESCRIPTION: Creates a red rectangular region at (22, 68) spanning 108 by 32 pixels.
; PLAN: r0=22(x), r1=68(y), r2=108(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 68
LDI r2, 108
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
