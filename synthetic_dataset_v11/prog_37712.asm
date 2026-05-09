; DESCRIPTION: Creates a yellow rectangular region at (16, 67) spanning 116 by 78 pixels.
; PLAN: r0=16(x), r1=67(y), r2=116(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 67
LDI r2, 116
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
