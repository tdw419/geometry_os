; DESCRIPTION: Creates a blue rectangular region at (34, 67) spanning 61 by 35 pixels.
; PLAN: r0=34(x), r1=67(y), r2=61(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 67
LDI r2, 61
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
