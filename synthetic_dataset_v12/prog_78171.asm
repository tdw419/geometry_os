; DESCRIPTION: Creates a red rectangular region at (140, 67) spanning 58 by 54 pixels.
; PLAN: r0=140(x), r1=67(y), r2=58(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 67
LDI r2, 58
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
