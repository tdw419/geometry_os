; DESCRIPTION: Creates a red rectangular region at (67, 58) spanning 22 by 57 pixels.
; PLAN: r0=67(x), r1=58(y), r2=22(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 58
LDI r2, 22
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
