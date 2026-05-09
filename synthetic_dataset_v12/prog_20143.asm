; DESCRIPTION: Creates a yellow rectangular region at (200, 67) spanning 39 by 34 pixels.
; PLAN: r0=200(x), r1=67(y), r2=39(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 67
LDI r2, 39
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
