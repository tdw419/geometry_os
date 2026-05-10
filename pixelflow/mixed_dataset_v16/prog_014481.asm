; DESCRIPTION: Creates a red rectangular region at (191, 192) spanning 67 by 34 pixels.
; PLAN: r0=191(x), r1=192(y), r2=67(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 192
LDI r2, 67
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
